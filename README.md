<<<<<<< HEAD
### What is this?
In the interest of saving everyone's time, we use homework assignments to pre-qualify DevOps Engineer candidates.  This lets us be objective during the interviews and focus on the candidate's ability to solve complex problems and defend their choice of technology or approach.  We also evaluate how candidates handle stress, time pressure, criticism and scrutiny from peers, management or operations teams.

### TL;DR

***To be considered for an interview you need to complete the "Assignment" section below.***

Once completed, please work with your recruiting agency to let us know.  Don't forget to provide them with the GitHub url to your project.

### Assignment
As a member of the development team your mission is to ensure:

- Application (a simple ruby app that responds with "Hello World!" to anyone who visits it) is reasonably resilient and a single node failure does not affect end users.
- Application can be scaled, preferably automatically, to handle increased loads.
- Infrastructure and required services provisioning as well as application deployment is automated and can be triggered with a click of a button or a command in a terminal. 
- Changes to the application's source code can be automatically tested before they are merged into the master branch.
- Specific version of the app can be launched for troubleshooting, testing, showcasing, etc.

Fork this repo first.

As you work on your solution you will inevitably have questions - please post them via the Issues tab ^.

This is intentionally an open ended assignment.  Have fun with it and be prepared to discuss and whiteboard your solution during the interview.


### Caveats
Source code repository — we are assuming you will use GitHub — should be configured to execute a CI test (via Travis or Drone.io) when changes are introduced to it.  However, the test fixture itself can always return success as test automation is not the subject of this assignment.

You may use any free or open source OS, software packages, tools, etc. to develop your solution.

Docker, VirtualBox, AWS, GCE are all acceptable virtualization options but please do not send us binary images.  Your solution should be in the form of code or configuration, such as Packer, Vagrant, Chef, Ansible, shell, etc. which we can review and use to create the environment on our own.

=======
ansible-aws-elb
==========


An ansible role which registers/de-registers an AWS Elastic Computer instance (EC2) with an Elastic Load Balancer (ELB).

#### Variables

```yaml
# Should per default register an instance to an ELB
aws_elb_state               : "present"
aws_elb_region              : "eu-west-1"
aws_elb_ec2_elbs            : "name-of-the-ELB"
# The EC2 id which should associated with the ELB
aws_elb_instance_id         : "EC2-instance-id"
```


#### Usage

Add `ansible-aws-elb` to your roles and set vars in your `group_vars` or in your playbook file.

Example:

```yaml

- hosts: all

  roles:
    - ansible-aws-elb
```


#### License

Licensed under the MIT License. See the LICENSE file for details.
>>>>>>> 6e01c6696c8d37bbcbcfbe589cf7e728df36316b
