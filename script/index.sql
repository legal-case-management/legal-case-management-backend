ALTER TABLE judges
    MODIFY COLUMN full_name VARCHAR(255)
        GENERATED ALWAYS AS (CONCAT(last_name, ' ', first_name)) STORED;
ALTER TABLE judges
    ADD FULLTEXT INDEX idx_full_name (full_name);

ALTER TABLE legal_cases
    ADD FULLTEXT INDEX idx_plaintiff (plaintiff);

ALTER TABLE legal_cases
    ADD FULLTEXT INDEX idx_defendant (defendant);

