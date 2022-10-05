CREATE DATABASE library_management;

USE library_management;

CREATE TABLE tbl_publisher (
		publisher_PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
		publisher_PublisherAddress VARCHAR(200) NOT NULL,
		publisher_PublisherPhone VARCHAR(500) NOT NULL
	);

	CREATE TABLE tbl_book (
		book_BookID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		book_Title VARCHAR(100) NOT NULL,
		book_PublisherName VARCHAR(100) NOT NULL,
        CONSTRAINT fk_publisher_name1 FOREIGN KEY (book_PublisherName) REFERENCES tbl_publisher(publisher_PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
	);

	CREATE TABLE tbl_library_branch (
		library_branch_BranchID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		library_branch_BranchName VARCHAR(100) NOT NULL,
		library_branch_BranchAddress VARCHAR(200) NOT NULL
	);


	CREATE TABLE tbl_borrower (
		borrower_CardNo INT PRIMARY KEY NOT NULL auto_increment,
		borrower_BorrowerName VARCHAR(100) NOT NULL,
		borrower_BorrowerAddress VARCHAR(200) NOT NULL,
		borrower_BorrowerPhone VARCHAR(50) NOT NULL
	);

	

	CREATE TABLE tbl_book_loans (
		book_loans_LoansID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		book_loans_BookID INT NOT NULL,
        CONSTRAINT fk_book_id1 FOREIGN KEY (book_loans_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_BranchID INT NOT NULL,
        CONSTRAINT fk_branch_id1 FOREIGN KEY (book_loans_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_CardNo INT NOT NULL,
        CONSTRAINT fk_cardno FOREIGN KEY (book_loans_CardNo) REFERENCES tbl_borrower(borrower_CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_DateOut VARCHAR(50) NOT NULL,
		book_loans_DueDate VARCHAR(50) NOT NULL
	);

	 
	CREATE TABLE tbl_book_copies (
		book_copies_CopiesID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		book_copies_BookID INT NOT NULL,
        CONSTRAINT fk_book_id2 FOREIGN KEY (book_copies_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_copies_BranchID INT NOT NULL,
        CONSTRAINT fk_branch_id2 FOREIGN KEY (book_copies_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_copies_No_Of_Copies INT NOT NULL
	);

	CREATE TABLE tbl_book_authors (
		book_authors_AuthorID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		book_authors_BookID INT NOT NULL,
        CONSTRAINT fk_book_id3 FOREIGN KEY (book_authors_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_authors_AuthorName VARCHAR(50) NOT NULL
	);
