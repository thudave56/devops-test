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
