-- Find all active partnerships involving a specific company user.
SELECT 
    p.id AS partnership_id,
    p.partnership_name,
    c.company_name AS lead_company_name
FROM 
    Partnership p
JOIN 
    Partner_Company pc ON p.id = pc.partnership_id
JOIN 
    Users u ON pc.company_id = u.company_id
JOIN 
    Company c ON p.lead_company_id = c.id
WHERE 
    u.id = 3
    AND pc.invite_accepted = TRUE;
