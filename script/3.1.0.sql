ALTER TABLE decision_types RENAME TO document_types;


ALTER TABLE document_types
DROP COLUMN IF EXISTS the_end_decision,
DROP COLUMN IF EXISTS court_issued,
ADD COLUMN post_status VARCHAR(255),
ADD COLUMN extension_period INTEGER NOT NULL DEFAULT 0;


ALTER TABLE document_types
    RENAME COLUMN decision_type_id TO document_type_id;

ALTER TABLE document_types
    RENAME COLUMN decision_type_name TO document_type_name;


ALTER TABLE decisions
DROP CONSTRAINT IF EXISTS decisions_decision_type_id_fkey;


ALTER TABLE decisions RENAME TO documents;

ALTER TABLE documents
    RENAME COLUMN decision_id TO document_id;

ALTER TABLE documents
    RENAME COLUMN number TO document_number;

ALTER TABLE documents
    RENAME COLUMN added_date TO storage_date;

ALTER TABLE documents
    RENAME COLUMN decision_type_id TO document_type_id;

CREATE TABLE document_type_pre_statuses (
                                            document_type_id VARCHAR(255) NOT NULL,
                                            pre_status VARCHAR(50) NOT NULL
);

INSERT INTO document_type_pre_statuses (document_type_id, pre_status)
SELECT DISTINCT decision_type_id, pre_status
FROM handle_decision_types
WHERE active = TRUE;

UPDATE document_types dt
SET post_status = sub.post_status
    FROM (
    SELECT decision_type_id, post_status
    FROM (
        SELECT
            decision_type_id,
            post_status,
            COUNT(*) AS cnt,
            ROW_NUMBER() OVER (
                PARTITION BY decision_type_id
                ORDER BY COUNT(*) DESC
            ) AS rn
        FROM handle_decision_types
        WHERE active = true
        GROUP BY decision_type_id, post_status
    ) t
    WHERE rn = 1
) sub
WHERE dt.document_type_id = sub.decision_type_id;

UPDATE document_types dt
SET extension_period = sub.extension_period
    FROM (
    SELECT decision_type_id, extension_period
    FROM (
        SELECT
            decision_type_id,
            extension_period,
            COUNT(*) AS cnt,
            ROW_NUMBER() OVER (
                PARTITION BY decision_type_id
                ORDER BY COUNT(*) DESC
            ) AS rn
        FROM handle_decision_types
        WHERE active = true
        GROUP BY decision_type_id, extension_period
    ) t
    WHERE rn = 1
) sub
WHERE dt.document_type_id = sub.decision_type_id;

ALTER TABLE document_type_pre_statuses ADD CONSTRAINT fk1b8n3s7qz5v0xk2d9p4h6t1yz
    FOREIGN KEY (document_type_id)
        REFERENCES document_types(document_type_id)
        ON DELETE CASCADE;

DROP TABLE IF EXISTS handle_decision_types;

UPDATE documents
SET document_id = REPLACE(document_id, 'QD', 'TL')
WHERE document_id LIKE '%QD%';

ALTER TABLE documents
    RENAME CONSTRAINT decisions_pkey TO documents_pkey;


ALTER TABLE document_types
    RENAME CONSTRAINT decision_types_pkey TO document_types_pkey;

ALTER TABLE documents
DROP CONSTRAINT fkiuv04x8qshnkdi19f24gcbgjx;

ALTER TABLE documents
    ADD CONSTRAINT fkiuv04x8qshnkdi19f24gcbgjx
        FOREIGN KEY (document_type_id)
            REFERENCES document_types(document_type_id)
            ON UPDATE CASCADE;

ALTER TABLE document_type_pre_statuses
DROP CONSTRAINT fk1b8n3s7qz5v0xk2d9p4h6t1yz;

ALTER TABLE document_type_pre_statuses
    ADD CONSTRAINT fk1b8n3s7qz5v0xk2d9p4h6t1yz
        FOREIGN KEY (document_type_id)
            REFERENCES document_types(document_type_id)
            ON UPDATE CASCADE;

UPDATE document_types
SET document_type_id = 'TL' || document_type_id;

ALTER TABLE documents
DROP CONSTRAINT fkiuv04x8qshnkdi19f24gcbgjx;

ALTER TABLE documents
    ADD CONSTRAINT fkiuv04x8qshnkdi19f24gcbgjx
        FOREIGN KEY (document_type_id)
            REFERENCES document_types(document_type_id);

ALTER TABLE document_type_pre_statuses
DROP CONSTRAINT fk1b8n3s7qz5v0xk2d9p4h6t1yz;

ALTER TABLE document_type_pre_statuses
    ADD CONSTRAINT fk1b8n3s7qz5v0xk2d9p4h6t1yz
        FOREIGN KEY (document_type_id)
            REFERENCES document_types(document_type_id);
