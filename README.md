TASK-6
# task6
Subqueries let you perform complex queries. Use scalar subqueries in SELECT to get single values like totals. IN/NOT IN in WHERE filters rows based on subquery results. EXISTS checks if a subquery returns any row. FROM subqueries act like temp tables. Correlated subqueries use outer query values for row-wise checks.

### 🔍 **Brief Theory: Subqueries and Nested Queries**

A **subquery** is a query placed inside another SQL query. It's used to perform intermediate calculations or filtering. Subqueries can be used in `SELECT`, `FROM`, and `WHERE` clauses to solve complex problems.

#### 📌 Types of Subqueries:

1. **Scalar Subquery (in SELECT):**
   Returns a single value. Useful for calculations like total, average, etc., for each row.

   ```sql
   SELECT name, (SELECT SUM(amount) FROM Orders WHERE Orders.customer_id = Customers.customer_id) AS total;
   ```

2. **Subquery in WHERE using IN / NOT IN:**
   Filters rows based on values returned by the subquery.

   ```sql
   SELECT name FROM Customers WHERE customer_id IN (SELECT customer_id FROM Orders);
   ```

3. **Subquery using EXISTS / NOT EXISTS:**
   Checks if the subquery returns any rows. Common in correlated queries.

   ```sql
   SELECT name FROM Customers c WHERE EXISTS (SELECT 1 FROM Orders o WHERE o.customer_id = c.customer_id);
   ```

4. **Subquery in FROM Clause (Inline View):**
   Treats the subquery as a temporary table.

   ```sql
   SELECT customer_id, AVG(amount) FROM (SELECT * FROM Orders) AS temp GROUP BY customer_id;
   ```

5. **Correlated Subquery:**
   Refers to outer query data. Runs once per row and is used for row-wise comparisons.

   ```sql
   SELECT * FROM Orders o1 WHERE amount > (SELECT AVG(amount) FROM Orders o2 WHERE o1.customer_id = o2.customer_id);
   ```

#### ✅ **Benefits:**

* Makes queries more readable
* Helps break down complex logic
* Powerful for filtering, grouping, and comparing data

#### 🎯 **Outcome:**

Using subqueries helps develop advanced SQL skills needed for real-world data analysis and application development.

Would you like this in **PDF or printable note format** too?

