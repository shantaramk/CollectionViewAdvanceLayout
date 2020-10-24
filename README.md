# CollectionViewAdvanceLayout
At the WWDC 2019, Apple introduced a new form of UICollectionViewLayout. If you ever worked with UICollectionView, you may have struggled with your layout attributes, or tweaking the FlowLayout. I, personally literally spent hours trying to get a good result, working for all iOS version, in every device, every size class, every orientation.  Well, meet UICollectionViewCompositionalLayout!

# # Introducing Compositional Layouts
That 's 
why Compositional Layouts is here.

# # As a feature

Group small Layouts into groups
Each Group of Layout constitutes a group of elements
Use in combination with Layouts smaller than subclasses
And so on.

# # 4 main components
It is mainly composed of the following four elements.

Item Item
Group
Section
Layout
Item, Group, Section, Layout build a hierarchical structure.
