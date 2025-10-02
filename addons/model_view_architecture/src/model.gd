@abstract
## Model serves as a base class for all data models. It should not be instantiated directly, but subclasses for your particular object you need to represent.
##
## The Model class provides methods for dependency resolution, data serialization and initialization.
## Dependency Resolution - Model will recursively resolve serialization and loading based through it's children.  If it has property of type Model, it will resolve it (and it's children) before performing serialization or initialization functions
## Serialization - Model will serialize itself and it's dependencies using one of two methods - Binary or Json.
## Initialization - Model will initialize it's children first, then resolve itself when load() is called.
## Construction - Each model can create it's respective node (view).
class_name Model extends Resource

@export var node_scene: PackedScene

static func is_model_view(node: Node) -> bool:
    return true if "model" in node else false