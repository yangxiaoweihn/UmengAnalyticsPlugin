# plugin_umeng_analytics

A new flutter plugin project.

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

### 事件统计 ``onAnalyticsEvent``
```
[required] `event`: String       事件ID
[optional] `param`: Map<String, String>      事件附带参数
[optional] `extra`: int      只在统计|计算 事件中起作用
```

### 页面统计 ``onAnalyticsPage``
```
[required] `page`: String       页面ID
[required] `visible`: boolean   页面可见性 
```