const sql = require('mssql');
const fs = require('fs');
const USERNAME = 'sa';
const PASSWORD = 'Test12345@';
const schemaPath = '../schema-model/Tables/schema.sql';
const functionPaths = ['../schema-model/Functions/scalar-function.sql', '../schema-model/Functions/table-valued-function.sql']
// Configure database connection
const config = {
    user: USERNAME,
    password: PASSWORD,
    database: 'RestaurantDB',
    server: "127.0.0.1",
    options: {
        enableArithAbort: true,
        trustServerCertificate: true,
    },
};


// Jest setup and teardown for database connection
beforeAll(async () => {
    try {
        await sql.connect(config);
        const script = fs.readFileSync(schemaPath, 'utf8');
        await sql.query(script);
        functionPaths.forEach(await sql.query);
        console.log('SQL script executed successfully.');
    } catch (err) {
        console.error('Database setup error:', err);
    }


});

afterAll(async () => {
    try {
        await close();
    } catch (err) {
        console.error('Database close connection error:', err);
    }
});

// Jest test case
test('Average Rating for Menu Item Function', async () => {
    try {
        const menuItemId = 1; // Replace with the actual menu item ID
        await sql.connect(config);
        const result = await sql.query(`SELECT dbo.fn_AverageRatingForMenuItem(${menuItemId}) AS AverageRating`);
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