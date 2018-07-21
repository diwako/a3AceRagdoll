#define REQUIRED_VERSION 1.82
#define VERSION "1.1"

class CfgPatches {
  class diwako_ragdoll {
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {
      "ace_medical"
      ,"cba_common"
      ,"ace_common"
    };
    author[] = {"diwako"};
    authorUrl = "https://github.com/diwako/a3AceRagdoll";
    version = VERSION;
    versionStr = VERSION;
  license = "https://www.bohemia.net/community/licenses/arma-public-license-share-alike";
  };
};

class Extended_PreInit_EventHandlers {
  class diwako_ragdoll {
    init = "call compile preprocessFileLineNumbers 'diwako_ragdoll\functions\diwako\ragdoll\cba_settings.sqf'";
  };
};

#include "cfgFunctions.hpp"
#include "cfgMovesMaleSdr.hpp"