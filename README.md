consul Cookbook
===============
Chef cookbook to install and configure Consul.

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

e.g.
#### packages
- `toaster` - consul needs toaster to brown your bagel.

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### consul::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['consul']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### consul::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `consul` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[consul]"
  ]
}
```
