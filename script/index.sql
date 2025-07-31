ALTER TABLE judges
    MODIFY COLUMN full_name VARCHAR(255)
        GENERATED ALWAYS AS (CONCAT(last_name, ' ', first_name)) STORED;
ALTER TABLE judges
    ADD FULLTEXT INDEX idx_full_name (full_name);

