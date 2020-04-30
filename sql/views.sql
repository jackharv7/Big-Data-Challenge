CREATE OR REPLACE VIEW public.vinecount AS
select * from vine_table where vine = 'Y';

CREATE OR REPLACE VIEW public.nonvinecount AS
select * from vine_table where vine = 'N';

CREATE OR REPLACE VIEW public.prodvine AS
SELECT review_id_table.product_id
   FROM review_id_table
     JOIN vine_table ON vine_table.review_id = review_id_table.review_id
  WHERE vine_table.vine = 'Y';
  
CREATE OR REPLACE VIEW public.prodnovine AS
SELECT review_id_table.product_id
   FROM review_id_table
     JOIN vine_table ON vine_table.review_id = review_id_table.review_id
  WHERE vine_table.vine = 'N';

--10,975 = 0.12%
select count(*) from vinecount; 

--9,205,504 = 99.88%
select count(*) from nonvinecount;
-- total = 9,216,479

-- Get the top 20 products that have vine and non-vine reviews
SELECT yesvine.product_id, COUNT(*)
FROM prodvine AS yesvine
INNER JOIN prodnovine AS novine ON yesvine.product_id = novine.product_id 
GROUP BY yesvine.product_id
ORDER BY COUNT(*) DESC LIMIT 20;

-- Check if the rating changes depending of the type of review, only for top 5 products
SELECT rev.product_id, app.vine, app.star_rating, COUNT(*)
FROM review_id_table AS rev, vine_table AS app
WHERE rev.review_id = app.review_id 
  AND (rev.product_id = 'B00B1N0R6C' OR rev.product_id = 'B008DNAJ5M' OR 
	   rev.product_id = 'B001VC16KE' OR rev.product_id = 'B00HA2ZKCO' OR 
	   rev.product_id = 'B002CLQ1Q2')
GROUP BY rev.product_id, app.vine, app.star_rating
ORDER BY COUNT(*) DESC;

--Vine user top reviews by number of votes
select * from vine_table where vine = 'Y'
order by total_votes desc limit 5;

--Non vine user top reviews by number of votes
select * from vine_table where vine = 'N'
order by total_votes desc limit 5;