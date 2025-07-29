-- Classes with teacher assignments and room details
INSERT INTO class (id, name, academic_year, teacher_id, room_number, schedule) VALUES 
  (1, 'Grade 1', '2025', 1, 'Room 101', 'Monday-Friday 8:00-12:00'),
  (2, 'Grade 2', '2025', 2, 'Room 102', 'Monday-Friday 8:00-12:00'),
  (3, 'Grade 3', '2025', 3, 'Room 103', 'Monday-Friday 8:00-12:00'),
  (4, 'Grade 4', '2025', 4, 'Room 104', 'Monday-Friday 8:00-12:00'),
  (5, 'Grade 5', '2025', 5, 'Room 105', 'Monday-Friday 8:00-12:00'),
  (6, 'Grade 6', '2025', 6, 'Room 106', 'Monday-Friday 8:00-12:00');

-- Teachers with login details, subjects, and class assignments
INSERT INTO staff (id, first_name, last_name, email, position, username, password, subjects, class_id, phone_number, address, date_of_birth, hire_date, qualification) VALUES
  (1, 'Blessing', 'Chikore', 'blessing.chikore@example.com', 'Teacher', 'blessing.chikore', 'password123', 'Mathematics, English', 1, '+263 77 123 4567', '123 Harare Street, Harare', '1985-03-15', '2020-01-15', 'B.Ed Mathematics'),
  (2, 'Rudo', 'Munyoro', 'rudo.munyoro@example.com', 'Teacher', 'rudo.munyoro', 'password123', 'English, Shona', 2, '+263 77 234 5678', '456 Bulawayo Road, Harare', '1988-07-22', '2020-02-01', 'B.Ed English'),
  (3, 'Tawanda', 'Mugadza', 'tawanda.mugadza@example.com', 'Teacher', 'tawanda.mugadza', 'password123', 'Science, Mathematics', 3, '+263 77 345 6789', '789 Mutare Street, Harare', '1983-11-08', '2019-08-15', 'B.Sc Education'),
  (4, 'Memory', 'Chirinda', 'memory.chirinda@example.com', 'Teacher', 'memory.chirinda', 'password123', 'Social Studies, English', 4, '+263 77 456 7890', '321 Gweru Avenue, Harare', '1987-05-12', '2020-03-01', 'B.Ed Social Studies'),
  (5, 'Tinashe', 'Mawere', 'tinashe.mawere@example.com', 'Teacher', 'tinashe.mawere', 'password123', 'Mathematics, Science', 5, '+263 77 567 8901', '654 Masvingo Road, Harare', '1986-09-30', '2019-09-15', 'B.Sc Mathematics'),
  (6, 'Patience', 'Moyo', 'patience.moyo@example.com', 'Teacher', 'patience.moyo', 'password123', 'English, Literature', 6, '+263 77 678 9012', '987 Chitungwiza Street, Harare', '1984-12-03', '2020-01-20', 'B.Ed English Literature'),
  (7, 'Liberty', 'Chikomba', 'liberty.chikomba@example.com', 'Teacher', 'liberty.chikomba', 'password123', 'Physical Education, Health', NULL, '+263 77 789 0123', '147 Bindura Road, Harare', '1989-01-25', '2020-04-01', 'B.Ed Physical Education'),
  (8, 'Rufaro', 'Chikafu', 'rufaro.chikafu@example.com', 'Teacher', 'rufaro.chikafu', 'password123', 'Art, Music', NULL, '+263 77 890 1234', '258 Kwekwe Street, Harare', '1986-06-18', '2020-05-15', 'B.Ed Fine Arts'),
  (9, 'Tariro', 'Chikanda', 'tariro.chikanda@example.com', 'Teacher', 'tariro.chikanda', 'password123', 'Computer Studies, ICT', NULL, '+263 77 901 2345', '369 Kadoma Avenue, Harare', '1987-08-14', '2020-06-01', 'B.Sc Computer Science'),
  (10, 'Tafadzwa', 'Chikomba', 'tafadzwa.chikomba@example.com', 'Teacher', 'tafadzwa.chikomba', 'password123', 'Religious Studies, Ethics', NULL, '+263 77 012 3456', '741 Marondera Road, Harare', '1985-04-07', '2020-07-01', 'B.Ed Religious Studies'),
  (11, 'Nyasha', 'Chikore', 'nyasha.chikore@example.com', 'Teacher', 'nyasha.chikore', 'password123', 'Agriculture, Environmental Science', NULL, '+263 77 123 4567', '852 Chegutu Street, Harare', '1988-10-20', '2020-08-15', 'B.Sc Agriculture'),
  (12, 'Farai', 'Chikanda', 'farai.chikanda@example.com', 'Teacher', 'farai.chikanda', 'password123', 'Home Economics, Life Skills', NULL, '+263 77 234 5678', '963 Norton Avenue, Harare', '1984-02-11', '2020-09-01', 'B.Ed Home Economics'),
  (13, 'Chipo', 'Chikafu', 'chipo.chikafu@example.com', 'Teacher', 'chipo.chikafu', 'password123', 'Library Studies, Reading', NULL, '+263 77 345 6789', '159 Ruwa Road, Harare', '1986-12-05', '2020-10-01', 'B.Ed Library Science'),
  (14, 'Munyaradzi', 'Chikomba', 'munyaradzi.chikomba@example.com', 'Teacher', 'munyaradzi.chikomba', 'password123', 'Guidance and Counseling', NULL, '+263 77 456 7890', '357 Epworth Street, Harare', '1987-03-28', '2020-11-01', 'M.Ed Counseling'),
  (15, 'Vimbai', 'Chikore', 'vimbai.chikore@example.com', 'Teacher', 'vimbai.chikore', 'password123', 'Special Education', NULL, '+263 77 567 8901', '486 Hatcliffe Road, Harare', '1985-07-16', '2020-12-01', 'B.Ed Special Education'),
  (16, 'Kudzai', 'Chikanda', 'kudzai.chikanda@example.com', 'Teacher', 'kudzai.chikanda', 'password123', 'Sports Coaching, Athletics', NULL, '+263 77 678 9012', '753 Glenview Street, Harare', '1989-05-09', '2021-01-01', 'B.Ed Physical Education');

-- Students with login details and comprehensive information
INSERT INTO student (id, first_name, last_name, email, username, password, class_id, date_of_birth, gender, address, phone_number, parent_name, parent_phone, admission_date, student_number) VALUES
  (1, 'Tendai', 'Moyo', 'tendai.moyo@example.com', 'tendai.moyo', 'student123', 1, '2018-03-15', 'Male', '123 Harare Street, Harare', '+263 77 111 1111', 'Mr. Moyo', '+263 77 111 1112', '2024-01-15', 'ST001'),
  (2, 'Ruvimbo', 'Chikafu', 'ruvimbo.chikafu@example.com', 'ruvimbo.chikafu', 'student123', 1, '2018-07-22', 'Female', '456 Bulawayo Road, Harare', '+263 77 222 2222', 'Mrs. Chikafu', '+263 77 222 2223', '2024-01-15', 'ST002'),
  (3, 'Tatenda', 'Chirwa', 'tatenda.chirwa@example.com', 'tatenda.chirwa', 'student123', 2, '2017-11-08', 'Male', '789 Mutare Street, Harare', '+263 77 333 3333', 'Mr. Chirwa', '+263 77 333 3334', '2024-01-15', 'ST003'),
  (4, 'Kudzai', 'Mutsvairo', 'kudzai.mutsvairo@example.com', 'kudzai.mutsvairo', 'student123', 2, '2017-05-12', 'Female', '321 Gweru Avenue, Harare', '+263 77 444 4444', 'Mrs. Mutsvairo', '+263 77 444 4445', '2024-01-15', 'ST004'),
  (5, 'Nyasha', 'Mugabe', 'nyasha.mugabe@example.com', 'nyasha.mugabe', 'student123', 3, '2016-09-30', 'Male', '654 Masvingo Road, Harare', '+263 77 555 5555', 'Mr. Mugabe', '+263 77 555 5556', '2024-01-15', 'ST005'),
  (6, 'Chipo', 'Ndlovu', 'chipo.ndlovu@example.com', 'chipo.ndlovu', 'student123', 3, '2016-12-03', 'Female', '987 Chitungwiza Street, Harare', '+263 77 666 6666', 'Mrs. Ndlovu', '+263 77 666 6667', '2024-01-15', 'ST006'),
  (7, 'Farai', 'Sibanda', 'farai.sibanda@example.com', 'farai.sibanda', 'student123', 4, '2015-01-25', 'Male', '147 Bindura Road, Harare', '+263 77 777 7777', 'Mr. Sibanda', '+263 77 777 7778', '2024-01-15', 'ST007'),
  (8, 'Tafadzwa', 'Dube', 'tafadzwa.dube@example.com', 'tafadzwa.dube', 'student123', 4, '2015-06-18', 'Female', '258 Kwekwe Street, Harare', '+263 77 888 8888', 'Mrs. Dube', '+263 77 888 8889', '2024-01-15', 'ST008'),
  (9, 'Ropafadzo', 'Mlambo', 'ropafadzo.mlambo@example.com', 'ropafadzo.mlambo', 'student123', 5, '2014-08-14', 'Male', '369 Kadoma Avenue, Harare', '+263 77 999 9999', 'Mr. Mlambo', '+263 77 999 9990', '2024-01-15', 'ST009'),
  (10, 'Tariro', 'Gumbo', 'tariro.gumbo@example.com', 'tariro.gumbo', 'student123', 5, '2014-04-07', 'Female', '741 Marondera Road, Harare', '+263 77 000 0000', 'Mrs. Gumbo', '+263 77 000 0001', '2024-01-15', 'ST010'),
  (11, 'Munyaradzi', 'Chikore', 'munyaradzi.chikore@example.com', 'munyaradzi.chikore', 'student123', 6, '2013-10-20', 'Male', '852 Chegutu Street, Harare', '+263 77 111 0000', 'Mr. Chikore', '+263 77 111 0001', '2024-01-15', 'ST011'),
  (12, 'Vimbai', 'Mawere', 'vimbai.mawere@example.com', 'vimbai.mawere', 'student123', 6, '2013-02-11', 'Female', '963 Norton Avenue, Harare', '+263 77 222 0000', 'Mrs. Mawere', '+263 77 222 0001', '2024-01-15', 'ST012');

-- Comprehensive 4-term payment history for all students
-- Term 1 Payments (2024)
INSERT INTO finance_record (id, description, amount, type, date, student_id, term, academic_year, payment_method, receipt_number) VALUES
  (1, 'Term 1 Fees - Tendai Moyo', 120.00, 'Payment', '2024-01-15', 1, 'Term 1', '2024', 'Cash', 'RCP001'),
  (2, 'Term 1 Fees - Ruvimbo Chikafu', 120.00, 'Payment', '2024-01-16', 2, 'Term 1', '2024', 'Bank Transfer', 'RCP002'),
  (3, 'Term 1 Fees - Tatenda Chirwa', 120.00, 'Payment', '2024-01-17', 3, 'Term 1', '2024', 'Cash', 'RCP003'),
  (4, 'Term 1 Fees - Kudzai Mutsvairo', 120.00, 'Payment', '2024-01-18', 4, 'Term 1', '2024', 'Mobile Money', 'RCP004'),
  (5, 'Term 1 Fees - Nyasha Mugabe', 120.00, 'Payment', '2024-01-19', 5, 'Term 1', '2024', 'Cash', 'RCP005'),
  (6, 'Term 1 Fees - Chipo Ndlovu', 120.00, 'Payment', '2024-01-20', 6, 'Term 1', '2024', 'Bank Transfer', 'RCP006'),
  (7, 'Term 1 Fees - Farai Sibanda', 120.00, 'Payment', '2024-01-21', 7, 'Term 1', '2024', 'Cash', 'RCP007'),
  (8, 'Term 1 Fees - Tafadzwa Dube', 120.00, 'Payment', '2024-01-22', 8, 'Term 1', '2024', 'Mobile Money', 'RCP008'),
  (9, 'Term 1 Fees - Ropafadzo Mlambo', 120.00, 'Payment', '2024-01-23', 9, 'Term 1', '2024', 'Cash', 'RCP009'),
  (10, 'Term 1 Fees - Tariro Gumbo', 120.00, 'Payment', '2024-01-24', 10, 'Term 1', '2024', 'Bank Transfer', 'RCP010'),
  (11, 'Term 1 Fees - Munyaradzi Chikore', 120.00, 'Payment', '2024-01-25', 11, 'Term 1', '2024', 'Cash', 'RCP011'),
  (12, 'Term 1 Fees - Vimbai Mawere', 120.00, 'Payment', '2024-01-26', 12, 'Term 1', '2024', 'Mobile Money', 'RCP012');

-- Term 2 Payments (2024)
INSERT INTO finance_record (id, description, amount, type, date, student_id, term, academic_year, payment_method, receipt_number) VALUES
  (13, 'Term 2 Fees - Tendai Moyo', 120.00, 'Payment', '2024-05-15', 1, 'Term 2', '2024', 'Cash', 'RCP013'),
  (14, 'Term 2 Fees - Ruvimbo Chikafu', 120.00, 'Payment', '2024-05-16', 2, 'Term 2', '2024', 'Bank Transfer', 'RCP014'),
  (15, 'Term 2 Fees - Tatenda Chirwa', 120.00, 'Payment', '2024-05-17', 3, 'Term 2', '2024', 'Cash', 'RCP015'),
  (16, 'Term 2 Fees - Kudzai Mutsvairo', 120.00, 'Payment', '2024-05-18', 4, 'Term 2', '2024', 'Mobile Money', 'RCP016'),
  (17, 'Term 2 Fees - Nyasha Mugabe', 120.00, 'Payment', '2024-05-19', 5, 'Term 2', '2024', 'Cash', 'RCP017'),
  (18, 'Term 2 Fees - Chipo Ndlovu', 120.00, 'Payment', '2024-05-20', 6, 'Term 2', '2024', 'Bank Transfer', 'RCP018'),
  (19, 'Term 2 Fees - Farai Sibanda', 120.00, 'Payment', '2024-05-21', 7, 'Term 2', '2024', 'Cash', 'RCP019'),
  (20, 'Term 2 Fees - Tafadzwa Dube', 120.00, 'Payment', '2024-05-22', 8, 'Term 2', '2024', 'Mobile Money', 'RCP020'),
  (21, 'Term 2 Fees - Ropafadzo Mlambo', 120.00, 'Payment', '2024-05-23', 9, 'Term 2', '2024', 'Cash', 'RCP021'),
  (22, 'Term 2 Fees - Tariro Gumbo', 120.00, 'Payment', '2024-05-24', 10, 'Term 2', '2024', 'Bank Transfer', 'RCP022'),
  (23, 'Term 2 Fees - Munyaradzi Chikore', 120.00, 'Payment', '2024-05-25', 11, 'Term 2', '2024', 'Cash', 'RCP023'),
  (24, 'Term 2 Fees - Vimbai Mawere', 120.00, 'Payment', '2024-05-26', 12, 'Term 2', '2024', 'Mobile Money', 'RCP024');

-- Term 3 Payments (2024)
INSERT INTO finance_record (id, description, amount, type, date, student_id, term, academic_year, payment_method, receipt_number) VALUES
  (25, 'Term 3 Fees - Tendai Moyo', 120.00, 'Payment', '2024-09-15', 1, 'Term 3', '2024', 'Cash', 'RCP025'),
  (26, 'Term 3 Fees - Ruvimbo Chikafu', 120.00, 'Payment', '2024-09-16', 2, 'Term 3', '2024', 'Bank Transfer', 'RCP026'),
  (27, 'Term 3 Fees - Tatenda Chirwa', 120.00, 'Payment', '2024-09-17', 3, 'Term 3', '2024', 'Cash', 'RCP027'),
  (28, 'Term 3 Fees - Kudzai Mutsvairo', 120.00, 'Payment', '2024-09-18', 4, 'Term 3', '2024', 'Mobile Money', 'RCP028'),
  (29, 'Term 3 Fees - Nyasha Mugabe', 120.00, 'Payment', '2024-09-19', 5, 'Term 3', '2024', 'Cash', 'RCP029'),
  (30, 'Term 3 Fees - Chipo Ndlovu', 120.00, 'Payment', '2024-09-20', 6, 'Term 3', '2024', 'Bank Transfer', 'RCP030'),
  (31, 'Term 3 Fees - Farai Sibanda', 120.00, 'Payment', '2024-09-21', 7, 'Term 3', '2024', 'Cash', 'RCP031'),
  (32, 'Term 3 Fees - Tafadzwa Dube', 120.00, 'Payment', '2024-09-22', 8, 'Term 3', '2024', 'Mobile Money', 'RCP032'),
  (33, 'Term 3 Fees - Ropafadzo Mlambo', 120.00, 'Payment', '2024-09-23', 9, 'Term 3', '2024', 'Cash', 'RCP033'),
  (34, 'Term 3 Fees - Tariro Gumbo', 120.00, 'Payment', '2024-09-24', 10, 'Term 3', '2024', 'Bank Transfer', 'RCP034'),
  (35, 'Term 3 Fees - Munyaradzi Chikore', 120.00, 'Payment', '2024-09-25', 11, 'Term 3', '2024', 'Cash', 'RCP035'),
  (36, 'Term 3 Fees - Vimbai Mawere', 120.00, 'Payment', '2024-09-26', 12, 'Term 3', '2024', 'Mobile Money', 'RCP036');

-- Term 4 Payments (2024)
INSERT INTO finance_record (id, description, amount, type, date, student_id, term, academic_year, payment_method, receipt_number) VALUES
  (37, 'Term 4 Fees - Tendai Moyo', 120.00, 'Payment', '2024-12-15', 1, 'Term 4', '2024', 'Cash', 'RCP037'),
  (38, 'Term 4 Fees - Ruvimbo Chikafu', 120.00, 'Payment', '2024-12-16', 2, 'Term 4', '2024', 'Bank Transfer', 'RCP038'),
  (39, 'Term 4 Fees - Tatenda Chirwa', 120.00, 'Payment', '2024-12-17', 3, 'Term 4', '2024', 'Cash', 'RCP039'),
  (40, 'Term 4 Fees - Kudzai Mutsvairo', 120.00, 'Payment', '2024-12-18', 4, 'Term 4', '2024', 'Mobile Money', 'RCP040'),
  (41, 'Term 4 Fees - Nyasha Mugabe', 120.00, 'Payment', '2024-12-19', 5, 'Term 4', '2024', 'Cash', 'RCP041'),
  (42, 'Term 4 Fees - Chipo Ndlovu', 120.00, 'Payment', '2024-12-20', 6, 'Term 4', '2024', 'Bank Transfer', 'RCP042'),
  (43, 'Term 4 Fees - Farai Sibanda', 120.00, 'Payment', '2024-12-21', 7, 'Term 4', '2024', 'Cash', 'RCP043'),
  (44, 'Term 4 Fees - Tafadzwa Dube', 120.00, 'Payment', '2024-12-22', 8, 'Term 4', '2024', 'Mobile Money', 'RCP044'),
  (45, 'Term 4 Fees - Ropafadzo Mlambo', 120.00, 'Payment', '2024-12-23', 9, 'Term 4', '2024', 'Cash', 'RCP045'),
  (46, 'Term 4 Fees - Tariro Gumbo', 120.00, 'Payment', '2024-12-24', 10, 'Term 4', '2024', 'Bank Transfer', 'RCP046'),
  (47, 'Term 4 Fees - Munyaradzi Chikore', 120.00, 'Payment', '2024-12-25', 11, 'Term 4', '2024', 'Cash', 'RCP047'),
  (48, 'Term 4 Fees - Vimbai Mawere', 120.00, 'Payment', '2024-12-26', 12, 'Term 4', '2024', 'Mobile Money', 'RCP048');

-- Additional fee types (uniforms, books, etc.)
INSERT INTO finance_record (id, description, amount, type, date, student_id, term, academic_year, payment_method, receipt_number) VALUES
  (49, 'School Uniform - Tendai Moyo', 45.00, 'Payment', '2024-01-10', 1, 'Term 1', '2024', 'Cash', 'RCP049'),
  (50, 'Textbooks - Ruvimbo Chikafu', 35.00, 'Payment', '2024-01-12', 2, 'Term 1', '2024', 'Bank Transfer', 'RCP050'),
  (51, 'Sports Equipment - Tatenda Chirwa', 25.00, 'Payment', '2024-01-14', 3, 'Term 1', '2024', 'Cash', 'RCP051'),
  (52, 'Library Fee - Kudzai Mutsvairo', 15.00, 'Payment', '2024-01-16', 4, 'Term 1', '2024', 'Mobile Money', 'RCP052'),
  (53, 'Computer Lab Fee - Nyasha Mugabe', 20.00, 'Payment', '2024-01-18', 5, 'Term 1', '2024', 'Cash', 'RCP053'),
  (54, 'Science Lab Fee - Chipo Ndlovu', 30.00, 'Payment', '2024-01-20', 6, 'Term 1', '2024', 'Bank Transfer', 'RCP054');

-- Homework assignments for students
INSERT INTO homework (id, title, description, subject, due_date, class_id, teacher_id) VALUES
  (1, 'Mathematics Practice', 'Complete exercises 1-10 in Chapter 3', 'Mathematics', '2024-01-20', 1, 1),
  (2, 'English Essay', 'Write a 200-word essay about your family', 'English', '2024-01-22', 1, 2),
  (3, 'Science Project', 'Create a simple circuit diagram', 'Science', '2024-01-25', 2, 3),
  (4, 'Social Studies Report', 'Research and write about Zimbabwe history', 'Social Studies', '2024-01-28', 2, 4),
  (5, 'Mathematics Quiz', 'Practice multiplication tables 1-12', 'Mathematics', '2024-01-30', 3, 5),
  (6, 'English Reading', 'Read Chapter 5 and answer questions', 'English', '2024-02-02', 3, 6),
  (7, 'Science Experiment', 'Conduct the water cycle experiment', 'Science', '2024-02-05', 4, 3),
  (8, 'Art Project', 'Create a traditional Zimbabwean mask', 'Art', '2024-02-08', 4, 8),
  (9, 'Physical Education', 'Practice basic gymnastics moves', 'Physical Education', '2024-02-10', 5, 7),
  (10, 'Computer Studies', 'Create a simple PowerPoint presentation', 'Computer Studies', '2024-02-12', 5, 9);

-- Attendance records for students (sample for first week)
INSERT INTO attendance_record (id, student_id, date, present) VALUES
  (1, 1, '2024-01-15', true),
  (2, 2, '2024-01-15', true),
  (3, 3, '2024-01-15', true),
  (4, 4, '2024-01-15', false),
  (5, 5, '2024-01-15', true),
  (6, 6, '2024-01-15', true),
  (7, 7, '2024-01-15', true),
  (8, 8, '2024-01-15', true),
  (9, 9, '2024-01-15', false),
  (10, 10, '2024-01-15', true),
  (11, 11, '2024-01-15', true),
  (12, 12, '2024-01-15', true),
  (13, 1, '2024-01-16', true),
  (14, 2, '2024-01-16', true),
  (15, 3, '2024-01-16', true),
  (16, 4, '2024-01-16', true),
  (17, 5, '2024-01-16', true),
  (18, 6, '2024-01-16', true),
  (19, 7, '2024-01-16', false),
  (20, 8, '2024-01-16', true),
  (21, 9, '2024-01-16', true),
  (22, 10, '2024-01-16', true),
  (23, 11, '2024-01-16', true),
  (24, 12, '2024-01-16', true);

-- Inventory items for school
INSERT INTO inventory_item (id, name, description, quantity, category, location, supplier, cost) VALUES
  (1, 'Textbooks - Grade 1', 'Mathematics and English textbooks', 50, 'Books', 'Library', 'Zimbabwe Book Publishers', 25.00),
  (2, 'Pencils', 'HB pencils for students', 500, 'Stationery', 'Store Room', 'Office Supplies Ltd', 0.50),
  (3, 'Exercise Books', 'A4 exercise books', 300, 'Stationery', 'Store Room', 'Paper Products Co', 2.00),
  (4, 'Whiteboard Markers', 'Dry erase markers', 100, 'Teaching Aids', 'Staff Room', 'Educational Supplies', 3.50),
  (5, 'Science Lab Equipment', 'Basic laboratory equipment', 20, 'Equipment', 'Science Lab', 'Lab Equipment Ltd', 150.00),
  (6, 'Sports Equipment', 'Football, netball, athletics equipment', 30, 'Sports', 'Sports Store', 'Sports Equipment Co', 75.00),
  (7, 'Computer Equipment', 'Desktop computers and accessories', 25, 'Technology', 'Computer Lab', 'Tech Solutions', 800.00),
  (8, 'Art Supplies', 'Paint, brushes, paper for art classes', 200, 'Art', 'Art Room', 'Creative Supplies', 15.00),
  (9, 'First Aid Kit', 'Medical supplies for school clinic', 10, 'Medical', 'School Clinic', 'Medical Supplies Ltd', 50.00),
  (10, 'Library Books', 'Fiction and non-fiction books', 500, 'Books', 'Library', 'Book Distributors', 20.00);

-- Transport records for students
INSERT INTO transport_record (id, student_id, route, pickup_time, dropoff_time, driver_name, vehicle_number, date) VALUES
  (1, 1, 'Route A - Harare Central', '07:30', '16:30', 'Mr. Chikomba', 'ABC123', '2024-01-15'),
  (2, 2, 'Route A - Harare Central', '07:30', '16:30', 'Mr. Chikomba', 'ABC123', '2024-01-15'),
  (3, 3, 'Route B - Chitungwiza', '07:15', '16:45', 'Mrs. Mugabe', 'XYZ789', '2024-01-15'),
  (4, 4, 'Route B - Chitungwiza', '07:15', '16:45', 'Mrs. Mugabe', 'XYZ789', '2024-01-15'),
  (5, 5, 'Route C - Epworth', '07:45', '16:15', 'Mr. Sibanda', 'DEF456', '2024-01-15'),
  (6, 6, 'Route C - Epworth', '07:45', '16:15', 'Mr. Sibanda', 'DEF456', '2024-01-15'),
  (7, 7, 'Route D - Norton', '07:00', '17:00', 'Mrs. Dube', 'GHI789', '2024-01-15'),
  (8, 8, 'Route D - Norton', '07:00', '17:00', 'Mrs. Dube', 'GHI789', '2024-01-15'),
  (9, 9, 'Route E - Ruwa', '07:20', '16:40', 'Mr. Mlambo', 'JKL012', '2024-01-15'),
  (10, 10, 'Route E - Ruwa', '07:20', '16:40', 'Mr. Mlambo', 'JKL012', '2024-01-15'),
  (11, 11, 'Route F - Hatcliffe', '07:10', '16:50', 'Mrs. Gumbo', 'MNO345', '2024-01-15'),
  (12, 12, 'Route F - Hatcliffe', '07:10', '16:50', 'Mrs. Gumbo', 'MNO345', '2024-01-15'); 