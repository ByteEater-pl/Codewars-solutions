SELECT
  SUBSTRING (project FROM 1 FOR commits) project,
  SUBSTRING (address FROM CHAR_LENGTH (address) - contributors + 1) address
FROM repositories;
