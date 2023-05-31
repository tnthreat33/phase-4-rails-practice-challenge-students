class StudentController < ActionController::API

    def index
    students = Student.all 
    render json: students, include: :instructor 
    end 
    
    def update
        student = Student.find_by(id: params[:id])
    
        if student 
            student.update(student_params)
            render json: student 
        else 
            render json: {error: "Not Found"}, status: :not_found
        end 
    end
    
    def create 
        student = Student.create(student_params)
        render json: student, status: :created
    end 
    
    def destroy 
        student = Student.find_by(id: params[:id])
        if student 
            student.destroy 
            head :no_content 
        else 
            render json: {error: "Not Found"}, status: :not_found
        end 
    end 
    
    
    private 
    
    def student_params
        params.permit(:name)
    end 
    
    
    end