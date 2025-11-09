CREATE INDEX semester_by_semester ON courses (semester);
CREATE INDEX enrollments_by_course_id ON enrollments (student_id);
CREATE INDEX satisfies_by_course_id ON satisfies (course_id);
CREATE INDEX students_by_id ON students (id);

