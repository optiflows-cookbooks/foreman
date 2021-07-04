# Changelog

## Unreleased

## 0.0.2 - *2021-06-01*

- Adopted by Sous-Chefs
- Deprecate ubuntu 14.04 support
- Support only 18.04 and debian 10 as per foreman 2.1 supported platforms
- Drop support for apache <2.4
- Refactor some stuff to be compatible with newer resource driven cookbook version
- Pin some cookbooks to older resource driven versions
- Removed dependency on hostname cookbook. This no longer updates the hostname of a node
