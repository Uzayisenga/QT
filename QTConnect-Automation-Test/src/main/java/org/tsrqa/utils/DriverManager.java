package org.tsrqa.utils;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.ios.IOSDriver;
import io.appium.java_client.android.AndroidDriver;
import org.json.JSONObject;
import org.openqa.selenium.remote.DesiredCapabilities;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;

public class DriverManager {
    private static final ThreadLocal<AppiumDriver> driver = new ThreadLocal<>();

    public static AppiumDriver getDriver() {
        return driver.get();
    }

    public static void setDriver(AppiumDriver driver1) {
        driver.set(driver1);
    }

    public static void initializeDriver(String platform) throws MalformedURLException {
        JSONObject jsonObject = new JSONObject(
                JsonParser.parse("Devices.json").getJSONObject(platform).toString()
        );

        String userName = "testsolutionsrwa_z5vQCE";
        String accessKey = "sxAYLzJ6WwoZo5oXKpQo";
        String buildName = "404 Build";
        String app = jsonObject.getString("bundleId");

        DesiredCapabilities capabilities = new DesiredCapabilities();

        HashMap<String, Object> browserstackOptions = new HashMap<>();
        browserstackOptions.put("projectName", "QTConnect " + platform);
        browserstackOptions.put("buildName", buildName);
        browserstackOptions.put("sessionName", "Testing");
        browserstackOptions.put("appiumVersion", "2.0.1");
    
capabilities.setCapability("browserstack.user", "testsolutionsrwa_z5vQCE");
capabilities.setCapability("browserstack.key", "sxAYLzJ6WwoZo5oXKpQo");
capabilities.setCapability("app", "00008130-000E79810E60001C");
capabilities.setCapability("device", "iPhone 15 Pro Max");
capabilities.setCapability("os_version", "17.1");
capabilities.setCapability("project", "My Project");
capabilities.setCapability("build", "My Build");
capabilities.setCapability("name", "Test Name");




        if (platform.equalsIgnoreCase("iOS")) {
            capabilities.setCapability("udid", jsonObject.getString("udid"));
        } else if (platform.equalsIgnoreCase("Android")) {
            // Add Android-specific capabilities if needed
        }

        URL url = new URL("https://" + userName + ":" + accessKey + "@hub-cloud.browserstack.com/wd/hub");

        AppiumDriver appiumDriver;
        if (platform.equalsIgnoreCase("iOS")) {
            appiumDriver = new IOSDriver(url, capabilities);
        } else if (platform.equalsIgnoreCase("Android")) {
            appiumDriver = new AndroidDriver(url, capabilities);
        } else {
            throw new IllegalArgumentException("Invalid platform: " + platform);
        }

        setDriver(appiumDriver);
    }
}