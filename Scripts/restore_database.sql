-- 2. Se restaura la base de datos (con ajuste de nombres logicos y rutas)
RESTORE DATABASE AdventureWorksDW2025
FROM DISK =  N'C:\Backups\AdventureWorksDW2025.bak'
WITH MOVE 'AdventureWorksDW' TO N'C:\SQLData\AdventureWorksDW2025.mdf',
	 MOVE 'AdventureWorksDW_log' TO N'C:\SQLData\AdventureWorksDW2025_log.mdf',
	 STATS = 10;