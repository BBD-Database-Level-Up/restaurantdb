const sql = require('mssql');
const USERNAME = 'test';
const PASSWORD = 'test';
const URL = 'restaurant-db.chulcebul0ir.eu-west-1.rds.amazonaws.com'

// Configure database connection
const config = {
    user: USERNAME,
    password: PASSWORD,
    server: 'sql-server',
    database: 'RestaurantDB-test',

};


// Jest setup and teardown for database connection
beforeAll(async () => {
    try {
        await sql.connect(config);
    } catch (err) {
        console.error('Database connection error:', err);
    }
});

afterAll(async () => {
    try {
        await sql.close();
    } catch (err) {
        console.error('Database close connection error:', err);
    }
});

// Jest test case
test('Average Rating for Menu Item Function', async () => {
    try {
        const menuItemId = 1; // Replace with the actual menu item ID
        const result = await sql.query`SELECT dbo.fn_AverageRatingForMenuItem(${menuItemId}) AS AverageRating`;
        const averageRating = result.recordset[0].AverageRating;

        // Assert that the average rating is a decimal value
        expect(typeof averageRating).toBe('number');

        // Add more assertions as needed
        // For example, you could assert that the average rating is within a certain range
        // expect(averageRating).toBeGreaterThan(0);

    } catch (err) {
        console.error('Test error:', err);
        throw err;
    }
});