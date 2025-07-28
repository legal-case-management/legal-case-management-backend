ALTER TABLE judges
    ADD COLUMN full_name VARCHAR(255) GENERATED ALWAYS AS (CONCAT(last_name, ' ', first_name)) STORED,
ADD FULLTEXT INDEX idx_full_name (full_name);