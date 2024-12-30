CREATE TABLE Role (
    id INT PRIMARY KEY,
    role_name VARCHAR(255) NOT NULL
);

CREATE TABLE Company (
    id INT PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    domain VARCHAR(255) NOT NULL
);

CREATE TABLE Partnership (
    id INT PRIMARY KEY,
    lead_company_id INT NOT NULL,
    partnership_name VARCHAR(255),
    FOREIGN KEY (lead_company_id) REFERENCES Company(id)
);

CREATE TABLE Partner_Company (
    company_id INT,
    partnership_id INT,
    invite_accepted BOOLEAN,
    PRIMARY KEY (company_id, partnership_id),
    FOREIGN KEY (company_id) REFERENCES Company(id),
    FOREIGN KEY (partnership_id) REFERENCES Partnership(id)
);

CREATE TABLE Users (
    id INT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    role_id INT,
    company_id INT,
    FOREIGN KEY (role_id) REFERENCES Role(id),
    FOREIGN KEY (company_id) REFERENCES Company(id)
);

CREATE TABLE Collaboration_Users (
    id INT PRIMARY KEY,
    user_id INT NOT NULL,
    role VARCHAR(20) NOT NULL,
    partnership_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (partnership_id) REFERENCES Partnership(id)
);

CREATE TABLE Solution (
    id INT PRIMARY KEY,
    partnership_id INT,
    name VARCHAR(255),
    description TEXT,
    FOREIGN KEY (partnership_id) REFERENCES Partnership(id)
);

CREATE TABLE Campaign (
    id INT PRIMARY KEY,
    partnership_id INT,
    campaign_name VARCHAR(255),
    start_date DATE,
    end_date DATE,
    solution_id INT,
    FOREIGN KEY (partnership_id) REFERENCES Partnership(id),
    FOREIGN KEY (solution_id) REFERENCES Solution(id)
);

CREATE TABLE Leads (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    email VARCHAR(255) UNIQUE,
    campaign_id INT,
    solution_id INT,
    FOREIGN KEY (campaign_id) REFERENCES Campaign(id),
    FOREIGN KEY (solution_id) REFERENCES Solution(id)
);

CREATE TABLE Accounts (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    website VARCHAR(255),
    lead_id INT,
    FOREIGN KEY (lead_id) REFERENCES Leads(id)
);

CREATE TABLE Opportunities (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    account_id INT,
    amount DECIMAL(15, 2),
    lead_id INT,
    FOREIGN KEY (account_id) REFERENCES Accounts(id),
    FOREIGN KEY (lead_id) REFERENCES Leads(id)
);
