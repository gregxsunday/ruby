class StudentsController < ApplicationController
    @@students = [{"imie" => "Jan", "nazwisko" => "Kowalski", "edit" => FALSE, "rok" => 2}, {"imie" => "Anna", "nazwisko" => "Nowak", "edit" => TRUE, "rok" => 4}]
    def index 
        puts @@students
        @students = @@students

        query = request.env['QUERY_STRING']
        @can_edit = FALSE
        if query != ''
            surname = query[query.index('=') + 1..query.length - 1]
            # @can_edit = surname == 'Nowak'
            @@students.each do |student|
                if student['nazwisko'] == surname && student['edit'] == TRUE
                    @can_edit = TRUE
                end
            end
        end
        puts @can_edit
    end

    def update
        @nazwisko = params[:id]
        @imie = params[:imie]
        @rok = params[:rok]
        @edit = params[:edit]

        @@students.each do |student|
            if student['nazwisko'] == @nazwisko
                student['imie'] = @imie
                student['rok'] = @rok
                student['edit'] = @edit == '1'
            end
        end
        redirect_to '/students'
    end

    def create
        @nazwisko = params[:nazwisko]
        @imie = params[:imie]
        @rok = params[:rok]
        @edit = params[:edit]

        new_student = {"imie" => @imie, "nazwisko" => @nazwisko, "edit" => @edit == '1', "rok" => @rok}
        @@students.push(new_student)
        redirect_to '/students'
    end
end
