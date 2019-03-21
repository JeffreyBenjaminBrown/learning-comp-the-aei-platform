# My understanding of ParamTools so far

The schema file consists of a single json object that defines a single schema. The "schema_name" field in that json object defines the name of the schema. Everything else defines dimensions. "dims" defines mandatory dimensions, and "optional" defines optional dimensions. The purpose of dimensions is to define parameters.

The defaults file consists of a single json object, each member of which is a parameter. For each parameter there are a number of mandatory fields, such as title and description, as defined [here](https://paramtools.readthedocs.io/en/latest/spec.html#parameter-object). Any optional dimension from the schema can also be a field of any parameter.

The "value" field of a parameter is a list of dictionaries that allow oen to infer the value of the parameter, based on the dimensions used as inputs. For a given parameter (but not across parameters), each dictionary in the "value" field must have the same set of keys. One of those keys must be "value"; it indicates the output resulting from the other key values.


## One of the following two paragraphs seems likely to be true:

Every value output from the value function is assumed to be an n-dimensional array, where n can be 0 (indicating a scalar). number_dims should record that value n.

The values output by the value function should be the same kind of thing. In the event that the outputs are n-dimensional arrays, n should be constant (across values within that parameter), and indicated by number_dims. If the outputs are anything else -- strings or lists or functions or whatnot -- number_dims should be 0.


# If everything I just said is right, then ...

The code could be more self-documenting at zero increase (unless lengthening a string counts as an increase) in complexity, through the following name changes:

"dims" -> "parameter inputs"
"optional" -> "parameter attributes"
outer "value" -> "function"
  ("table" and "map" would also be accurate, but "function" conveys more information)
inner "value" -> "output"

Also, it seems like it would be clarifying if every first-level json field of a parameter was called an attribute: The optional attributes defined in the schema, the mandatory attributes [defined in the docs](https://paramtools.readthedocs.io/en/latest/spec.html#parameter-object), and in particular the "value" field which describes the parameter's value as a function of some input vector of dimensions -- at least in English, those are all literally attributes of the parameter, so it seems helpful to use the same terminology for them all. Moreover this would make it easier to distinguish the attributes-of-a-parameter from the dimensions-of-the-input-to-the-function-determining-the-parameter's-value.


# Two questions arise

## The schema for schemas

Does every element of "dims" require a "type" and a "validators", and does every element of "optional" require a "type" and a "number_dims"? And are no other level-3 fields permissible in either position?


## Can the shape of the (fixed-dimension) output value grid of a parameter vary across input vectors?

That is, the number of axes is fixed, but should the length of the axes be constant across input vectors?