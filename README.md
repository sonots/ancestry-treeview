# ancestry-treeview [![Build Status](https://secure.travis-ci.org/sonots/ancestry-treeview.png?branch=master)](http://travis-ci.org/sonots/ancestry-treeview) [![Dependency Status](https://gemnasium.com/sonots/ancestry-treeview.png)](https://gemnasium.com/sonots/ancestry-treeview)

testing ruby: 1.9.2, 1.9.3, 2.0.0; ancestry: 2.0.0

ancestry-treeview is an extension of `ancestry` gem to show a tree view which looks like http://jsfiddle.net/Fh47n/.

## Install

    gem install ancestry-treeview

## Usage

### Basic Usage

Add the following code in your `app/assets/stylesheets/application.css.scss`

    @import "ancestry-treeview";

Then, call

    node.tree

in your view where `node` is your `ancestry` model. 

### Custom Link

Default html links in the tree view are as

    <a href="#">id</a>
    
You can change the html link by giving a block as

    node.tree {|node| link_to("text", your_controller_path(node)) }

### Contraint Depth

As default, all childrens of a node is shown as a tree. Use `to_depth` option to contraint the depth

    node.tree(to_depth: 1)

## Acknowledgements

I appreciate Vitaliy Bychik for giving such a nice css style at http://stackoverflow.com/questions/11167628/trees-in-twitter-bootstrap .

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new [Pull Request](../../pull/new/master)

## Copyright

Copyright (c) 2013 Naotoshi SEO. See [LICENSE](LICENSE) for details.
