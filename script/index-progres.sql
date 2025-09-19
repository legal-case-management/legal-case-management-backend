-- Generated column
ALTER TABLE officers
    DROP COLUMN full_name;

ALTER TABLE officers
    ADD COLUMN full_name VARCHAR(255)
        GENERATED ALWAYS AS (last_name || ' ' || first_name) STORED;

-- Fulltext search indexes
CREATE INDEX idx_full_name
    ON officers
    USING GIN (to_tsvector('simple', full_name));

CREATE INDEX idx_plaintiff
    ON legal_cases
    USING GIN (to_tsvector('simple', plaintiff));

CREATE INDEX idx_defendant
    ON legal_cases
    USING GIN (to_tsvector('simple', defendant));


