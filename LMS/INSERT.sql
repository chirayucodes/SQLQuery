INSERT INTO Categories (BookCategory)
VALUES 
('Fiction'),
('Non-Fiction');

INSERT INTO MemberType (TypeName, MaxBooks)
VALUES
('Standard', 2),
('Premium', 4);

INSERT INTO Members ([Name], MemberTypeID)
VALUES
('Chirayu Singh', 1),  
('Rahul Verma', 2),    
('Sneha Sharma', 1),   
('Aditi Mehta', 2);   



INSERT INTO BookDetails 
(BookTitle, AuthorName, PublisherName, BookPrice, CategoryID)
VALUES
('Five Point Someone', 'Chetan Bhagat', 'Rupa Publications', 299.99, 1),
('The 3 Mistakes of My Life', 'Chetan Bhagat', 'Rupa Publications', 250.00, 1),
('The Guide', 'R. K. Narayan', 'Indian Thought Publications', 199.50, 1),
('Train to Pakistan', 'Khushwant Singh', 'Grove Press', 320.00, 1),
('The White Tiger', 'Aravind Adiga', 'HarperCollins', 350.00, 1),
('Wings of Fire', 'A. P. J. Abdul Kalam', 'Universities Press', 275.00, 2),
('Ignited Minds', 'A. P. J. Abdul Kalam', 'Penguin Books', 260.00, 2),
('Annihilation of Caste', 'B. R. Ambedkar', 'Navayana', 300.00, 2),
('India 2020', 'A. P. J. Abdul Kalam', 'Penguin Books', 280.00, 2),
('My Experiments with Truth', 'Mahatma Gandhi', 'Navajivan Publishing', 240.00, 2);




INSERT INTO BookIssueDetails
(BookID, MemberID, IssueDate, RenewDate, ReturnDate, BookPrice)
VALUES
(1, 1, '2026-02-01', '2026-02-08', '2026-02-15', 299.99),
(6, 2, '2026-02-02', '2026-02-09', '2026-02-16', 275.00),
(3, 3, '2026-02-03', '2026-02-10', '2026-02-17', 199.50),
(8, 4, '2026-02-04', '2026-02-11', '2026-02-18', 300.00);