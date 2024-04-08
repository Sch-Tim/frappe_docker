This fork resolves the issues mentioned [here](https://discuss.frappe.io/t/yet-another-wkhtmltopdf-thread/120309). 
As a bonus, it's a multiarch build. You can use it with arm and x86.

**If you just want to use the built image:** 
1) Copy the compose.yml file and the example.env file. 
2) update the example.env as needed - especially the passwords and the traefik domain
3) up the containers. 
*I expect you to have a ready Traefik build. If not, please see somewhere else how to do that or use ports instead of expose.*

The built image has the addional apps
* erpnext_germany
* hrms
* payments

If you need more, you'll have to build it yourself. 
To easily build, you can use the docker-build.sh file. You may have to edit it slightly. 
