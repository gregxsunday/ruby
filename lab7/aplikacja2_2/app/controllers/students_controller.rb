class StudentsController < ApplicationController
    @@mystudent = nil
    def index
        @mystudent = @@mystudent
        if @mystudent
            puts 'valid #{@mystudent.valid?}'
            puts 'msgs #{@mystudent.errors.messages}'
        end
        query = request.env['QUERY_STRING']
        @can_edit = false
        if query != ''
            surname = query[query.index('=') + 1..query.length - 1]
            @@mystudent = Student.find_by(surname: surname)
            @can_edit = @@mystudent.can_edit
        end
        puts @can_edit
    end

    def update
        if @@mystudent
            @@mystudent.errors.clear
        end
        nazwisko = params[:id]
        imie = params[:imie]
        rok = params[:rok]
        edit = params[:edit] == '1'

        @@mystudent = Student.find_by(surname: nazwisko)
        @@mystudent.update(name: imie, can_edit: edit, rok: rok)
        redirect_to action: 'edit'
    end

    def create
        if @@mystudent
            @@mystudent.errors.clear
        end
        nazwisko = params[:nazwisko]
        imie = params[:imie]
        rok = params[:rok]
        edit = params[:edit] == '1'

        @@mystudent = Student.create(name: imie, surname: nazwisko, can_edit: edit, rok: rok)
        redirect_to '/students'
    end

    def destroy
        if @@mystudent
            @@mystudent.errors.clear
        end
        nazwisko = params[:id]
        @@mystudent = Student.find_by(surname: nazwisko)
        @@mystudent.destroy
        redirect_to '/students'
    end
end
