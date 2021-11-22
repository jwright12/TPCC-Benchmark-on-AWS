from selenium import webdriver
import chromedriver_binary
import time
import random

WAREHOUSE_ID = 1
DISTRICT_ID = random.radnint(1,10)
CUSTOMER_ID = random.randint(


driver = webdriver.Chrome()
driver.get("http://cs466.localhost")
wID = driver.find_element_by_name("warehouseID")
wID.send_keys(WAREHOUSE_ID)
time.sleep(10)

