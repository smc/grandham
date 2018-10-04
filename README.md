# Grandham, Bibliographic Data Project.

[![Build Status](https://travis-ci.org/smc/grandham.svg?branch=master)](https://travis-ci.org/smc/grandham)
[![Maintainability](https://api.codeclimate.com/v1/badges/f57724a16256ec2f7532/maintainability)](https://codeclimate.com/github/smc/grandham/maintainability)

 Grandham is a project intended to make available reliable bibliographic information on all Malayalam books published in Kerala and elsewhere. This Open data set contains Complete bibliography data from first Impression to 1995. This project wants to add following features to Malayalagrandham DB and build it as a bibliography web service

* Facility for adding/linking copyright expired books to malaylagrandha vivaram
* Adding ISBN & ISBN based seller discovery
* Building Interface for Publishers through with they can contribute their publication bibliography .
* Similar module for Libraries . That will be added to found in library section of each book
* A module for building qr code of bibliography with a malayalagrandham link
* Crowd sourced way for input and an approval queue interface for submissions.
* MARC21 and MARCXML support
* A dynamic visualization interface for book information browsing
* proper API , and app work flow documentation 

## Installation

Pre requirements
* Ruby 2.4
* Mysql/MariaDB

```bash
git clone https://github.com/smc/grandham
cd grandham
bin/setup
````


## Usage

```
cd grandham
rails s
```
## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MPL
