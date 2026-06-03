CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(255),
    cuisine VARCHAR(255),
    rating DECIMAL(2,1),
    reviews INT,
    cost_for_two INT,
    locality VARCHAR(100),
    delivery_time VARCHAR(50),
    restaurant_type VARCHAR(100)
);

CREATE TABLE MenuItems (
    item_id INT PRIMARY KEY,
    restaurant_id INT,
    category VARCHAR(100),
    item_name VARCHAR(255),
    price INT,
    FOREIGN KEY (restaurant_id)
    REFERENCES Restaurants(restaurant_id)
);


-- QUERY 1: Top 5 Highest Rated Restaurants
SELECT restaurant_name,
       rating
FROM Restaurants
ORDER BY rating DESC
LIMIT 5;



-- QUERY 2: Average Cost For Two By Cuisine
SELECT cuisine,
       AVG(cost_for_two) AS average_cost_for_two
FROM Restaurants
GROUP BY cuisine
ORDER BY average_cost_for_two DESC;


-- QUERY 3: Restaurants With More Than One Cuisine Tag
SELECT restaurant_name,
       cuisine
FROM Restaurants
WHERE cuisine LIKE '%,%';


-- QUERY 4: Highest Priced Menu Item
SELECT restaurant_name,
       item_name,
       price
FROM MenuItems
JOIN Restaurants
ON MenuItems.restaurant_id = Restaurants.restaurant_id
ORDER BY price DESC
LIMIT 1;