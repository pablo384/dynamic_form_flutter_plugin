class QuestionBase<T> {
  T value;
  String key;
  String label;
  String type;
  List<dynamic> options;
  bool require;
  bool show;
  int order;
  String controlType;
  List<dynamic> validators;
  QuestionBase({Map<String, dynamic> options = const {}}) {
    this.value = options['value'] ?? '';
    this.key = options['key'] ?? '';
    this.type = options['type'] ?? '';
    this.label = options['label'] ?? '';
    this.require = options['require'] ?? true;
    this.show = options['show'] ?? true;
    this.order = options['order'] ?? 1;
    this.controlType = options['controlType'] ?? '';
    this.validators = options['validators'] ?? [];
  }

  @override
  String toString() {
    return '{value:$value, key:$key, label:$label, type:$type, require:$require, show:$show}, order:$order, controlType:$controlType, options:${options.toString()}';
  }
}
