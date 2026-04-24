DELIMITER //

CREATE PROCEDURE bagianA()
BEGIN
    DECLARE nama VARCHAR(50) DEFAULT 'Ikrimansa';
    DECLARE nim VARCHAR(20) DEFAULT '231011001';
    DECLARE semester INT DEFAULT 4;
    DECLARE prodi VARCHAR(50) DEFAULT 'Informatika';
    DECLARE kampus VARCHAR(100) DEFAULT 'Universitas Mega Buana Palopo';

    SELECT CONCAT(
        'Mahasiswa ', nama, ' (', nim, ') dari Program Studi ', prodi,
        ' terdaftar di ', kampus, ' pada semester ', semester, '.'
    ) AS hasil;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE bagianB()
BEGIN
    DECLARE sks INT DEFAULT 18;
    DECLARE ipk DECIMAL(3,2) DEFAULT 3.20;
    DECLARE status_pembayaran VARCHAR(10) DEFAULT 'LUNAS';
    DECLARE semester INT DEFAULT 4;

    DECLARE status_data VARCHAR(20);
    DECLARE beban VARCHAR(20);
    DECLARE performa VARCHAR(30);

    -- VALIDASI
    IF status_pembayaran = 'LUNAS' AND semester > 0 AND sks > 0 THEN
        SET status_data = 'Valid';
    ELSE
        SET status_data = 'Tidak Valid';
    END IF;

    -- BEBAN STUDI
    IF sks BETWEEN 1 AND 12 THEN
        SET beban = 'Ringan';
    ELSEIF sks BETWEEN 13 AND 18 THEN
        SET beban = 'Sedang';
    ELSE
        SET beban = 'Padat';
    END IF;

    -- PERFORMA
    IF ipk >= 3.50 THEN
        SET performa = 'Sangat Baik';
    ELSEIF ipk >= 3.00 THEN
        SET performa = 'Baik';
    ELSEIF ipk >= 2.50 THEN
        SET performa = 'Cukup';
    ELSE
        SET performa = 'Perlu Pembinaan';
    END IF;

    SELECT 
        status_data AS status,
        beban AS beban_studi,
        performa AS performa_akademik;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE bagianC()
BEGIN
    DECLARE nama VARCHAR(50) DEFAULT 'Ikrimansa';
    DECLARE nim VARCHAR(20) DEFAULT '231011001';
    DECLARE semester INT DEFAULT 4;
    DECLARE sks INT DEFAULT 18;
    DECLARE ipk DECIMAL(3,2) DEFAULT 3.20;
    DECLARE status_pembayaran VARCHAR(10) DEFAULT 'LUNAS';

    DECLARE status_data VARCHAR(20);
    DECLARE beban VARCHAR(20);
    DECLARE performa VARCHAR(30);
    DECLARE kesimpulan VARCHAR(200);

    -- VALIDASI
    IF status_pembayaran = 'LUNAS' AND semester > 0 AND sks > 0 THEN
        SET status_data = 'Layak mengambil KRS';
    ELSE
        SET status_data = 'Tidak Layak';
    END IF;

    -- BEBAN
    IF sks BETWEEN 1 AND 12 THEN
        SET beban = 'Ringan';
    ELSEIF sks BETWEEN 13 AND 18 THEN
        SET beban = 'Sedang';
    ELSE
        SET beban = 'Padat';
    END IF;

    -- PERFORMA
    IF ipk >= 3.50 THEN
        SET performa = 'Sangat Baik';
    ELSEIF ipk >= 3.00 THEN
        SET performa = 'Baik';
    ELSEIF ipk >= 2.50 THEN
        SET performa = 'Cukup';
    ELSE
        SET performa = 'Perlu Pembinaan';
    END IF;

    SET kesimpulan = CONCAT(
        'Mahasiswa ', nama, ' dengan NIM ', nim, ' dinyatakan ', status_data,
        '. Beban studi ', beban, ' dengan performa ', performa, '.'
    );

    SELECT kesimpulan;
END //

  DELIMITER //

CREATE PROCEDURE bagianD()
BEGIN
    DECLARE nama1 VARCHAR(50) DEFAULT 'Ikrimansa';
    DECLARE ipk1 DECIMAL(3,2) DEFAULT 3.50;
    DECLARE sks1 INT DEFAULT 20;

    DECLARE nama2 VARCHAR(50) DEFAULT 'Aulia';
    DECLARE ipk2 DECIMAL(3,2) DEFAULT 3.40;
    DECLARE sks2 INT DEFAULT 22;

    DECLARE hasil VARCHAR(100);

    IF ipk1 > ipk2 THEN
        SET hasil = CONCAT(nama1, ' lebih baik dari ', nama2);
    ELSEIF ipk2 > ipk1 THEN
        SET hasil = CONCAT(nama2, ' lebih baik dari ', nama1);
    ELSE
        IF sks1 > sks2 THEN
            SET hasil = CONCAT(nama1, ' lebih baik dari ', nama2);
        ELSE
            SET hasil = CONCAT(nama2, ' lebih baik dari ', nama1);
        END IF;
    END IF;

    SELECT hasil;
END //

DELIMITER ;

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE skenario1()
BEGIN
    DECLARE sks INT DEFAULT 18;
    DECLARE ipk DECIMAL(3,2) DEFAULT 3.40;
    DECLARE semester INT DEFAULT 4;
    DECLARE status_pembayaran VARCHAR(10) DEFAULT 'LUNAS';

    DECLARE status_data VARCHAR(20);

    IF status_pembayaran = 'LUNAS' AND semester > 0 AND sks > 0 THEN
        SET status_data = 'VALID';
    ELSE
        SET status_data = 'TIDAK VALID';
    END IF;

    SELECT status_data;
END$$

DELIMITER ;

DROP PROCEDURE IF EXISTS skenario2;

DELIMITER $$

CREATE PROCEDURE skenario2()
BEGIN
    DECLARE sks INT DEFAULT 15;
    DECLARE ipk DECIMAL(3,2) DEFAULT 3.20;
    DECLARE semester INT DEFAULT 3;
    DECLARE status_pembayaran VARCHAR(10) DEFAULT 'BELUM';

    DECLARE status_data VARCHAR(20);

    IF status_pembayaran = 'LUNAS' AND semester > 0 AND sks > 0 THEN
        SET status_data = 'VALID';
    ELSE
        SET status_data = 'TIDAK VALID';
    END IF;

    SELECT status_data;
END$$

DELIMITER ;

DROP PROCEDURE IF EXISTS skenario3;

DELIMITER $$

CREATE PROCEDURE skenario3()
BEGIN
    DECLARE sks INT DEFAULT 0;
    DECLARE ipk DECIMAL(3,2) DEFAULT 2.80;
    DECLARE semester INT DEFAULT 2;
    DECLARE status_pembayaran VARCHAR(10) DEFAULT 'LUNAS';

    DECLARE status_data VARCHAR(20);

    IF status_pembayaran = 'LUNAS' AND semester > 0 AND sks > 0 THEN
        SET status_data = 'VALID';
    ELSE
        SET status_data = 'TIDAK VALID';
    END IF;

    SELECT status_data;
END$$

DELIMITER ;

CALL bagianA();
CALL bagianB();
CALL bagianC();
CALL bagianD();

CALL skenario1();
CALL skenario2();
CALL skenario3();
