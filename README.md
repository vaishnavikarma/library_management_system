# README

# Library Management System

## Rails Console Queries

### 1. Find a book by ID and ISBN
Book.find(1)
Book.find_by(isbn: "ISBN005")

Finds a book using its ID or ISBN.

### 2. Books published after 2015
Book.where("published_year > ?", 2015).order(published_year: :desc)
Lists books published after 2015, newest first.

### 3. Three newest books
Book.order(published_year: :desc).limit(3)
Returns the three books with the latest publication years.

### 4. Books by an author's name

Author.find_by(name: "R.K.Narayan").books
Finds an author by name and lists their books.

### 5. Members with overdue books
Member.joins(:borrowings)
      .where(borrowings: { return_date: nil })
      .where("borrowings.due_date < ?", Date.current)
      .distinct
Lists members whose books are unreturned and past their due dates.

### 6. Authors with their books
Author.includes(:books).each do |author|
  puts author.books
end
Lists every author's books. `includes` helps reduce extra database queries.

### 7. Faculty members
Member.where(type: "Faculty")
Lists only Faculty members using the STI type column.

### 8. Member referrals
member = Member.find_by(email: "priya@example.com")
member.refered_by_id
member.subordinates
Finds a member by email, shows who referred them, and lists the members they referred.

### 9. Books borrowed by a member

member = Member.find_by(email: "rahul@example.com")
member.borrowings.includes(:book).each do |borrowing|
  puts borrowing.book.title
end
Finds a member by email and lists all books they have ever borrowed, including returned and unreturned books.

### 10. Count books per author
Book.group(:author_id).count
Counts the books written by each author.
EOF
