
-- Su dung CSDL QuanLyBanHang
USE QuanLyBanHang;

-- 1. Them du lieu vao bang Customer
INSERT INTO Customer (cID, Name, cAge) VALUES
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

-- 2. Them du lieu vao bang Order
INSERT INTO `Order` (oID, cID, oDate, oTotalPrice) VALUES
(1, 1, '2006-03-21', NULL),
(2, 2, '2006-03-23', NULL),
(3, 1, '2006-03-16', NULL);

-- 3. Them du lieu vao bang Product
INSERT INTO Product (pID, pName, pPrice) VALUES
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

-- 4. Them du lieu vao bang OrderDetail
INSERT INTO OrderDetail (oID, pID, odQTY) VALUES
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 3),
(2, 3, 8),
(2, 5, 4),
(3, 1, 3),
(3, 3, 3);

-- 5. Hien thi ma hoa don, ngay mua va tong tien hien co
SELECT oID, oDate, oTotalPrice
FROM `Order`;

-- 6. Hien thi khach hang da mua hang va san pham da mua
SELECT DISTINCT c.cID, c.Name, p.pName
FROM Customer c
JOIN `Order` o ON c.cID = o.cID
JOIN OrderDetail od ON o.oID = od.oID
JOIN Product p ON od.pID = p.pID
ORDER BY c.cID, p.pID;

-- 7. Hien thi khach hang chua mua bat ky san pham nao
SELECT c.cID, c.Name
FROM Customer c
LEFT JOIN `Order` o ON c.cID = o.cID
WHERE o.oID IS NULL;

-- 8. Tinh tong gia tri tung hoa don
SELECT
    o.oID,
    o.oDate,
    SUM(od.odQTY * p.pPrice) AS oPrice
FROM `Order` o
JOIN OrderDetail od ON o.oID = od.oID
JOIN Product p ON od.pID = p.pID
GROUP BY o.oID, o.oDate
ORDER BY o.oID;
