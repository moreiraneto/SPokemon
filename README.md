# SPokemon

# Implementation description

This solution was implemented with a clean-swift design pattern.

# Image loading and caching

An image loading and caching library was included in the project: Kingfisher. This library deals with the image fetch and also has caching capacilities.

# Linting

The code linting was done using Swiftlint and the rules for it can be found in the .swiftlint.yml file.

# Object serialisation/deserialisation

The model serialisation and deserialisation is done by making data models conform to Codable protocol. The network layer is configured to map received data only into models that conform to Codable.

# Dependencies management

Dependencies are managed using Cocoapods.

# Configuration

Only a pod install is needed.
