-- List all company users with their roles.
SELECT u.username, u.email, r.role_name, c.company_name
FROM Users u
JOIN Company c ON u.company_id = c.id
JOIN Role r ON u.role_id = r.id;