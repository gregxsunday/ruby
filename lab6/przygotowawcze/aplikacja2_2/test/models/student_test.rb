require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  test "should add normal student" do
    st = Student.new(name: "Imie", surname: "Nazwisko", rok: 3, can_edit: false)
    assert st.save, "Saved the student"
  end

  test "should not add student with invalid name" do
    st = Student.new(name: "Imie1", surname: "Nazwisko", rok: 3, can_edit: false)
    assert_not st.save, "Saved the student with invalid name"
  end

  test "should not add student with invalid surname" do
    st = Student.new(name: "Imie", surname: "Nazwisko2", rok: 3, can_edit: false)
    assert_not st.save, "Saved the student with invalid surname"
  end

  test "should not add student with invalid year" do
    st = Student.new(name: "Imie", surname: "Nazwisko", rok: 6, can_edit: false)
    assert_not st.save, "Saved the student with invalid year"
  end

  test "should not add two students with the same surname" do
    st1 = Student.create(name: "Imie", surname: "Nazwisko", rok: 3, can_edit: false)
    st2 = Student.new(name: "Inneimie", surname: "Nazwisko", rok: 1, can_edit: true)
    assert_not st2.save, "Saved two students with the same surname"
  end

  test "should not add student without name" do
    st = Student.new(surname: "Nazwisko", rok: 3, can_edit: false)
    assert_not st.save, "Saved the student without name"
  end

  test "should not add student without surname" do
    st = Student.new(name: "Imie", rok: 3, can_edit: false)
    assert_not st.save, "Saved the student without surname"
  end

  test "should not add student without year" do
    st = Student.new(name: "Imie", surname: "Nazwisko", can_edit: false)
    assert_not st.save, "Saved the student without year"
  end

  test "should not add student without can_edit property" do
    st = Student.new(name: "Imie", surname: "Nazwisko", rok: 3)
    assert_not st.save, "Saved the student without can_edit property"
  end
end
