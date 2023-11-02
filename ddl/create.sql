
-- create tables in empty DB

-- entities: User, Booking, Activity

CREATE IF NOT EXISTS TABLE User(
    userID INTEGER(255) AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    userPassword VARCHAR(255) NOT NULL,
    registrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE IF NOT EXISTS TABLE Booking(
    bookingID INTEGER(255) AUTO_INCREMENT PRIMARY KEY,
    bookingCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE IF NOT EXISTS TABLE Activity(
    actitivyID INTEGER(255) AUTO_INCREMENT PRIMARY KEY,
    activityName VARCHAR(255) NOT NULL,
    placesAvailable INTEGER(255) NOT NULL,
    activityDate DATE
)

CREATE IF NOT EXISTS TABLE UserToBooking(
    userID INTEGER(255) AUTO_INCREMENT PRIMARY KEY,
    bookingID INTEGER(255) AUTO_INCREMENT PRIMARY KEY,
    PRIMARY KEY (userID, bookingID),
    FOREIGN KEY (userID) REFERENCES User(userID),
    FOREIGN KEY (bookingID) REFERENCES Booking(bookingID)
)

CREATE IF NOT EXISTS TABLE BookingToActivivy(
    bookingID INTEGER(255) AUTO_INCREMENT PRIMARY KEY,
    activityID INTEGER(255) AUTO_INCREMENT PRIMARY KEY,
    PRIMARY KEY (bookingID, activityID),
    FOREIGN KEY (bookingID) REFERENCES Booking(bookingID),
    FOREIGN KEY (activityID) REFERENCES Activity(activityID)
)