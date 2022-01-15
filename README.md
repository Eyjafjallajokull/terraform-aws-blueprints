# Terraform AWS blueprints

My personal collection of Terraform modules that can be used for bootstraping
AWS infrastructure. This is not meant to fit all needs, more like "copy, paste
and adopt".

## Modules

- [modules/service-asg-alb](modules/service-asg-alb/)
- [modules/service-asg](modules/service-asg/)
- [modules/service-cf-s3](modules/service-cf-s3/)
- [modules/service-single-instance](modules/service-single-instance/)

## Development

### Deprovision

```
aws s3 rm --recursive s3://blueprints-production-logs
aws s3 rm --recursive s3://blueprints-production-api-content
aws s3 rm --recursive s3://blueprints-production-website-content
aws rds modify-db-instance --no-deletion-protection --db-instance-identifier blueprints-production-api --output json
delete final snapshot
```

