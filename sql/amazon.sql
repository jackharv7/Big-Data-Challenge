--Total reviews
SELECT COUNT(*) FROM review_id_table;

--4,366,916
select count(*) from vine_table_shoes;

--4,850,360
select count(*) from vine_table_sports;

--Total unique customers 5,060,562
SELECT COUNT(*) FROM customers;

--Total unique products 2,947,059
select count(*) from products;

--Customer with most reviews
SELECT MAX(customer_count) FROM customers;

--Top 10 customers with most reviews
SELECT * FROM customers ORDER BY customer_count DESC LIMIT 10;

--Top products with most reviews
select re.product_id, prod.product_title, count(*)
from review_id_table as re, products as prod
where re.product_id = prod.product_id
group by re.product_id, prod.product_title
order by count(*) desc limit 10;

--Number of stars for vine and non vine accounts
SELECT star_rating, vine, COUNT(*)
FROM vine_table
GROUP BY star_rating, vine;

-- Reviews for shoes by star rating 
SELECT star_rating, vine, COUNT(*)
FROM vine_table_shoes
GROUP BY star_rating, vine;

-- Reviews for sports by star rating 
SELECT star_rating, vine, COUNT(*)
FROM vine_table_sports
GROUP BY star_rating, vine;

-- Vine reviews for shoes top 5 customers
SELECT customer_id, COUNT(*)
FROM vine_table_shoes AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND vine = 'Y'
GROUP BY customer_id
ORDER BY COUNT(*) DESC LIMIT 5;

-- Vine reviews for sports top 5 customers
SELECT customer_id, COUNT(*)
FROM vine_table_sports AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND vine = 'Y'
GROUP BY customer_id
ORDER BY COUNT(*) DESC LIMIT 5;

SELECT rev.customer_id, COUNT(*)
FROM vine_table_shoes AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND star_rating = 5 AND vine = 'Y'
GROUP BY customer_id
ORDER BY COUNT(*) DESC LIMIT 10;

select count(*) from vine_table;

--Top 5 vine customers by number of reviews (51)
SELECT customer_id, COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND vine = 'Y'
GROUP BY customer_id
ORDER BY COUNT(*) DESC LIMIT 5;

--Top customers by number of 5 star ratings for vine users (35)
SELECT rev.customer_id, COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND star_rating = 5 AND vine = 'Y'
GROUP BY customer_id
ORDER BY COUNT(*) DESC LIMIT 10;

--Top customers by number of 4 star ratings by vine users (30)
SELECT rev.customer_id, COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND star_rating = 4 AND vine = 'Y'
GROUP BY customer_id
ORDER BY COUNT(*) DESC LIMIT 10;

--Total 5 star reviews for vine customers (4,943) out of 10,975 = 45%
SELECT COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND star_rating = 5 AND vine = 'Y';

--Total 4 star reviews by Vine users (4,092) out of 10,975 = 37%
SELECT COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND star_rating = 4 AND vine = 'Y';

--Total 3 star reviews by Vine users (1,346) out of 10,975 = 12%
SELECT COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND star_rating = 3 AND vine = 'Y';

--Total 2 star reviews by Vine users (436) out of 10,975 = 4%
SELECT COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND star_rating = 2 AND vine = 'Y';

--Total 1 star reviews by Vine users (158) out of 10,975 = 1.4%
SELECT COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND star_rating = 1 AND vine = 'Y';


--Top 5 non vine customers by number of reviews (535)
SELECT customer_id, COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND vine = 'N'
GROUP BY customer_id
ORDER BY COUNT(*) DESC LIMIT 5;

--Top customers by number of 5 star ratings by non vine users (305)
SELECT rev.customer_id, COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND star_rating = 5 AND vine = 'N'
GROUP BY customer_id
ORDER BY COUNT(*) DESC LIMIT 10;

--Top customers by number of 4 star ratings by Non Vine users (208)
SELECT rev.customer_id, COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND star_rating = 4 AND vine = 'N'
GROUP BY customer_id
ORDER BY COUNT(*) DESC LIMIT 10;

--Total 5 star ratings for non-vine customers (5,675,112) out of 9,205,504 = 61%
SELECT COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND star_rating = 5 AND vine = 'N';

--Total 4 star ratings for non-vine customers (1,680,360) out of 9,205,504 = 18%
SELECT COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND star_rating = 4 AND vine = 'N';

--Total 3 star ratings for non-vine customers (783,299) out of 9,205,504 = 8.5%
SELECT COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND star_rating = 3 AND vine = 'N';

--Total 2 star ratings for non-vine customers (471,761) out of 9,205,504 = 5%
SELECT COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND star_rating = 2 AND vine = 'N';

--Total 1 star ratings for non-vine customers (594,972) out of 9,205,504 = 6%
SELECT COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND star_rating = 1 AND vine = 'N';


--Top Vine Customers count of star reviews
select rev.customer_id, star_rating, count(*)
from vine_table as vine, review_id_table as rev
where vine.review_id = rev.review_id and vine = 'Y'
and (customer_id = 20789642 or customer_id = 50699505 or customer_id = 49620639 or customer_id = 51286530 or customer_id = 27598356) 
group by customer_id, star_rating;

--Top Non Vine Customers count of star reviews
select rev.customer_id, star_rating, count(*)
from vine_table as vine, review_id_table as rev
where vine.review_id = rev.review_id and vine = 'N'
and (customer_id = 50820654 or customer_id = 37651511 or customer_id = 52870270 or customer_id = 26955164 or customer_id = 50227539) 
group by customer_id, star_rating;

-- Vine Top 5 products
SELECT rev.product_id, COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND vine = 'Y'
GROUP BY product_id
ORDER BY COUNT(*) DESC LIMIT 5;

-- Non Vine Top 5 products
SELECT rev.product_id, COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND vine = 'N'
GROUP BY product_id
ORDER BY COUNT(*) DESC LIMIT 5;

-- Vine Top 5 products star ratings
SELECT rev.product_id, vine.star_rating, COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND vine = 'Y'
AND (rev.product_id = 'B0089YI8AI' OR rev.product_id = 'B00AU6J68Q' 
	 OR rev.product_id = 'B003JK002Q' OR rev.product_id = 'B0066Q4GSO' 
	 OR rev.product_id = 'B00J4GHLFI')
GROUP BY rev.product_id, vine.star_rating;

--Top 5 product names by number of vine user reviews
SELECT *
FROM products
WHERE product_id = 'B0089YI8AI' OR product_id = 'B00AU6J68Q' 
     OR product_id = 'B003JK002Q' OR product_id = 'B0066Q4GSO'  
	 OR product_id = 'B00J4GHLFI';
	 
-- Non Vine Top 5 products star ratings
SELECT rev.product_id, vine.star_rating, COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND vine = 'N'
AND (rev.product_id = 'B001HBHNHE' OR rev.product_id = '7245456313' 
	 OR rev.product_id = 'B00FX0S4DC' OR rev.product_id = 'B000UVVX28' 
	 OR rev.product_id = 'B002QZ1RS6')
GROUP BY rev.product_id, vine.star_rating;

--Top 5 product names by number of non vine user reviews
SELECT *
FROM products
WHERE product_id = 'B001HBHNHE' OR product_id = '7245456313' 
     OR product_id = 'B00FX0S4DC' OR product_id = 'B000UVVX28'  
	 OR product_id = 'B002QZ1RS6';


-- Top 5 products
SELECT rev.product_id, COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id
GROUP BY product_id
ORDER BY COUNT(*) DESC LIMIT 5;