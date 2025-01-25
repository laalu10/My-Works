# EmployControllerApi

All URIs are relative to *http://localhost:8080*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createEmp**](EmployControllerApi.md#createEmp) | **POST** /api/create |  |
| [**deleteEmp**](EmployControllerApi.md#deleteEmp) | **DELETE** /api/delete/{id} |  |
| [**showEmp**](EmployControllerApi.md#showEmp) | **GET** /api/show |  |
| [**updateEmp**](EmployControllerApi.md#updateEmp) | **PUT** /api/update/{id} |  |


<a id="createEmp"></a>
# **createEmp**
> String createEmp(employee)



### Example
```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.EmployControllerApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("http://localhost:8080");

    EmployControllerApi apiInstance = new EmployControllerApi(defaultClient);
    Employee employee = new Employee(); // Employee | 
    try {
      String result = apiInstance.createEmp(employee);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling EmployControllerApi#createEmp");
      System.err.println("Status code: " + e.getCode());
      System.err.println("Reason: " + e.getResponseBody());
      System.err.println("Response headers: " + e.getResponseHeaders());
      e.printStackTrace();
    }
  }
}
```

### Parameters

| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **employee** | [**Employee**](Employee.md)|  | |

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |

<a id="deleteEmp"></a>
# **deleteEmp**
> String deleteEmp(id)



### Example
```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.EmployControllerApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("http://localhost:8080");

    EmployControllerApi apiInstance = new EmployControllerApi(defaultClient);
    Long id = 56L; // Long | 
    try {
      String result = apiInstance.deleteEmp(id);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling EmployControllerApi#deleteEmp");
      System.err.println("Status code: " + e.getCode());
      System.err.println("Reason: " + e.getResponseBody());
      System.err.println("Response headers: " + e.getResponseHeaders());
      e.printStackTrace();
    }
  }
}
```

### Parameters

| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **id** | **Long**|  | |

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |

<a id="showEmp"></a>
# **showEmp**
> List&lt;Employee&gt; showEmp()



### Example
```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.EmployControllerApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("http://localhost:8080");

    EmployControllerApi apiInstance = new EmployControllerApi(defaultClient);
    try {
      List<Employee> result = apiInstance.showEmp();
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling EmployControllerApi#showEmp");
      System.err.println("Status code: " + e.getCode());
      System.err.println("Reason: " + e.getResponseBody());
      System.err.println("Response headers: " + e.getResponseHeaders());
      e.printStackTrace();
    }
  }
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;Employee&gt;**](Employee.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |

<a id="updateEmp"></a>
# **updateEmp**
> String updateEmp(id, employee)



### Example
```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.EmployControllerApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("http://localhost:8080");

    EmployControllerApi apiInstance = new EmployControllerApi(defaultClient);
    Long id = 56L; // Long | 
    Employee employee = new Employee(); // Employee | 
    try {
      String result = apiInstance.updateEmp(id, employee);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling EmployControllerApi#updateEmp");
      System.err.println("Status code: " + e.getCode());
      System.err.println("Reason: " + e.getResponseBody());
      System.err.println("Response headers: " + e.getResponseHeaders());
      e.printStackTrace();
    }
  }
}
```

### Parameters

| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **id** | **Long**|  | |
| **employee** | [**Employee**](Employee.md)|  | |

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |

