abstract class BaseView extends BaseViewInput with BaseViewOutput {}

abstract class BaseViewInput {
  void dispose();
  void init();
}

abstract class BaseViewOutput {}
