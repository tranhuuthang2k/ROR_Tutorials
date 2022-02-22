# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 3.0.0

* Rails version 6.1.4

* Amazon active storage 

* Heroku

* ...
# Total 76 Functions of Ecommerce E-shopper
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
1. Login (email, password, facebook)
2. Register
3. Reset password,
4. Remember password
5. Logout, message chat fb
6. Page Blogs, detail blogs, blog other....
7. Product whistlist (love, unlove..)
8. Star Rate, View rate product
9. Review comment products
10. Review images, manage image detail
11. Product orthers of product detail
12. Add to cart
13. Manage carts
14. product classification (feature, recommend...)
15. Contacts
16. My orders 
17. History View products
18. Manage my order
19. Statistics of products purchased by month
20. Profile info ( avatar, name, address....)
21. Change password, change your avatar
22. Send email notification when order done & send bill
23. Roles ( admin, user...)
24. Brands
25. Product category
26. Search Product,price, brand
27. Product details
28. Manage size products
29. Manage Category
30. Manage Product
31. Manage Order
32. Manage Post
33. Manage User
34. Manage Comment
35. Manage Banner
36. Manage Availability
37. Manage Contacts
38. Checkout
39. Manage products view
40. Manage product rate star
41. Export excel, scv,json..
42. Popular search keywords
43. Notifications, notification list, single...
44. Manage Notification
45. Manage Popular keywords
46. Voucher sales (expired, cost of voucher)
47. Manage voucher
48. Manage category post(blog)
49. Share product to fb
50. Cancel order
51. Manage brand
52. Comment product
53. Method Shipping
54. Manage shipping, service
55. Manage city
56. Product Sold
57. Export Invoice
58. Dashboard 
    + Revenue of each month, year...
    + Hot selling products
    + Total products in the system
    + Total order cancel of month, year
    + Total warehouse of the system
    + Best selling products of month, year
    + Total sales orders in of month, year
    + The most searched keywords of the month
    + Products with the most views in the month
    + Total number of voucher codes for the month
    + Most ordered products of the week (what day, quantity)
    + Status of orders
    + Total number of brands in the system
    + Most order month
    + Top availability best selling
    + Top availability is ordering 
    + Total shipping services
    + The most shipped service

- is updating.........
----------------------------------------------------------------------------------
- Youtude demo : https://youtu.be/YARRuNM518o 
- facebook: https://facebook.com/thangneymar44
- Web demo : http://shopmrkatsu.herokuapp.com/
----------------------------------------------------------------------------------
- Run commanlines need to run project 
- bundle install
- rails db:migrate
- rails db:seed
- rails s
-----------------------------------------------------------------------------------
- if errors database missing then connect your mysql
- step 1:  mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root -p mysql
- step 2:  sudo mysql -u root -p
- step 3:  SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
------------------------------------------------------------------------------------
custom rails admin 
- http://www.antleon.com/2015/04/rails-admin-custom-dashboard/
------------------------------------------------------------------------------------
refresh && update my code heroku
- bundle exec rake assets:precompile 
run again heroku app, if code dont update then
- heroku restart
-----------------------------------------------------------------------------------
Error deployment heroku
- Error PG::DatatypeMismatch: ERROR: argument of WHERE must be type boolean, not type integer
- Fix: example Product.where(id: ids)
- Error ActiveRecord::StatementInvalid (PG::GroupingError: ERROR: column "order_items.created_at" must appear in the GROUP BY clause or be used in an aggregate function
- Fix: https://makandracards.com/bitcrowd/32883-pg-groupingerror-error-column-must-appear-in-the-group-by-clause-or-be-used-in-an-aggregate-function-in-rails-while-trying-group
-----------------------------------------------------------------------------------
clear cache
- rake tmp:cache:clear
