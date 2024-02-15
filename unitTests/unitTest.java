package unitTests;
import org.dbunit.DBTestCase;
import org.dbunit.PropertiesBasedJdbcDatabaseTester;
import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.xml.FlatXmlDataSetBuilder;
import org.junit.Before;
import org.junit.Test;

import java.io.FileInputStream;

public class MyDbUnitTest extends DBTestCase {

    @Override
    protected void setUpDatabaseConfig() {
        System.setProperty(PropertiesBasedJdbcDatabaseTester.DBUNIT_DRIVER_CLASS, "com.microsoft.sqlserver.jdbc.SQLServerDriver");
        System.setProperty(PropertiesBasedJdbcDatabaseTester.DBUNIT_CONNECTION_URL, "restaurant-db-dev.chulcebul0ir.eu-west-1.rds.amazonaws.com");
        System.setProperty(PropertiesBasedJdbcDatabaseTester.DBUNIT_USERNAME, "secrets.USERNAME");
        System.setProperty(PropertiesBasedJdbcDatabaseTester.DBUNIT_PASSWORD, "secrets.PASSWORD");
    }

    @Before
    public void setUp() throws Exception {
        super.setUp();
    }

    @Override
    protected IDataSet getDataSet() throws Exception {
        return new FlatXmlDataSetBuilder().build(new FileInputStream("path/to/your/dataset.xml"));
    }

    @Test
    public void testSomething() throws Exception {
        // Your test logic here
        // Example:
        // Get connection, execute SQL queries, and assert results
    }
}
