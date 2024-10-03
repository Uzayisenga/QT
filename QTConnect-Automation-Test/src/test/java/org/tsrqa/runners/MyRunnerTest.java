package org.tsrqa.runners;

import org.json.JSONObject;
import org.tsrqa.utils.DriverManager;
import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.apache.logging.log4j.ThreadContext;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;
import org.tsrqa.utils.JsonParser;

@RunWith(Cucumber.class)
@CucumberOptions(
        plugin = {"pretty", "html:target/cucumber/report.html", "summary"},
        features = {"src/test/resources"},
        glue = {"org.tsrqa.stepdef"},
        snippets = CucumberOptions.SnippetType.CAMELCASE,
        dryRun = false,
        monochrome = true,
        tags = "@One-to-OneMessaging"
)
public class MyRunnerTest {
    
    @BeforeClass
    public static void initialize() throws Exception {
        String platform = "iOS"; // or "Android"
        JSONObject jsonObject = new JSONObject(JsonParser.parse("Devices.json").getJSONObject(platform).toString());

        ThreadContext.put("ROUTINGKEY", jsonObject.getString("os_version") + "_"
                + jsonObject.getString("device"));

        DriverManager.initializeDriver(platform);
    }

    @AfterClass
    public static void quit() {
        if (DriverManager.getDriver() != null) {
            DriverManager.getDriver().quit();
            DriverManager.setDriver(null);
        }
    }
}