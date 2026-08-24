import "@typespec/http";
import "@typespec/rest";
import "@typespec/versioning";
import "@azure-tools/typespec-autorest";
import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";

using TypeSpec.Versioning;
using Azure.Core;
using Azure.ResourceManager;

/** Microsoft.Akhila Resource Provider management API. */
@armProviderNamespace
@service(#{ title: "Akhila" })
@versioned(Versions)
@armCommonTypesVersion(Azure.ResourceManager.CommonTypes.Versions.v5)
namespace Microsoft.Akhila;

/** The available API versions. */
enum Versions {
  /** The 2026-09-01 API version. */
  v2026_09_01: "2026-09-01",
}

/** The operations supported by the Microsoft.Akhila resource provider. */
interface Operations extends Azure.ResourceManager.Operations {}

/** The properties of an Akhila resource. */
model AkhilaResourceProperties {
  /** The display name of the resource. */
  displayName: string;

  /** The description of the resource. */
  description?: string;

  /** The status of the last operation. */
  @visibility(Lifecycle.Read)
  provisioningState?: ProvisioningState;
}

/** The provisioning state of an Akhila resource. */
@lroStatus
union ProvisioningState {
  ResourceProvisioningState,
  string,
}

/** An Akhila resource. */
model AkhilaResource is TrackedResource<AkhilaResourceProperties> {
  ...ResourceNameParameter<AkhilaResource>;
}

/** Resource operations for Akhila resources. */
@armResourceOperations
interface AkhilaResources {
  createOrUpdate is ArmResourceCreateOrReplaceAsync<AkhilaResource>;
  get is ArmResourceRead<AkhilaResource>;
  update is ArmCustomPatchSync<
    AkhilaResource,
    Azure.ResourceManager.Foundations.ResourceUpdateModel<
      AkhilaResource,
      AkhilaResourceProperties
    >
  >;
  delete is ArmResourceDeleteWithoutOkAsync<AkhilaResource>;
  listByResourceGroup is ArmResourceListByParent<AkhilaResource>;
  listBySubscription is ArmListBySubscription<AkhilaResource>;
}
