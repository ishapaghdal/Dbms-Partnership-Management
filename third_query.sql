-- List all users associated with a specific partnership, including their roles.
SELECT
    u.username,
    u.email,
    cu.role,
    c.company_name
FROM
    Partnership p
    JOIN Collaboration_user cu ON p.id = cu.partnership_id
    JOIN Users u ON cu.user_id = u.id
    JOIN Company c ON u.company_id = c.id
WHERE
    p.id = 1;