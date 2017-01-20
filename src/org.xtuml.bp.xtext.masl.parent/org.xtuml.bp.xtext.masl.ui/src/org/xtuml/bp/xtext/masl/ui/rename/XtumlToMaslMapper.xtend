package org.xtuml.bp.xtext.masl.ui.rename

import com.google.inject.Inject
import java.util.List
import org.eclipse.emf.ecore.EClass
import org.eclipse.xtext.naming.QualifiedName
import org.xtuml.bp.core.Attribute_c
import org.xtuml.bp.core.Component_c
import org.xtuml.bp.core.Function_c
import org.xtuml.bp.core.InstanceStateMachine_c
import org.xtuml.bp.core.InterfaceOperation_c
import org.xtuml.bp.core.ModelClass_c
import org.xtuml.bp.core.Operation_c
import org.xtuml.bp.core.Port_c
import org.xtuml.bp.core.StateMachineEvent_c
import org.xtuml.bp.core.StateMachineState_c
import org.xtuml.bp.core.StateMachine_c
import org.xtuml.bp.core.UserDataType_c
import org.xtuml.bp.core.common.NonRootModelElement
import org.xtuml.bp.xtext.masl.masl.structure.StructurePackage
import org.xtuml.bp.xtext.masl.masl.types.TypesPackage

class XtumlToMaslMapper {
	
	@Inject extension StructurePackage 
	@Inject extension TypesPackage
	
	public def List<EClass> getMaslEClasses(NonRootModelElement xtumlElement) {
		switch xtumlElement{
			Attribute_c:
				#[attributeDefinition]
			Function_c:
				#[domainServiceDeclaration, domainFunctionDeclaration]
//			FunctionParameter_c:
//				#[parameter]
			InterfaceOperation_c:
				#[terminatorServiceDeclaration, terminatorFunctionDeclaration]
			ModelClass_c:
				#[objectDeclaration]
			Operation_c:
				#[objectServiceDeclaration, objectFunctionDeclaration]
//			OperationParameter_c:
//				#[parameter]
			Port_c:
				#[terminatorDefinition]
			StateMachineState_c:
				#[stateDeclaration]
			StateMachineEvent_c:
				#[eventDefinition]
			UserDataType_c:
				#[typeDeclaration]
			default:			
				#[]
		}
	} 
	
	public def QualifiedName getMaslQualifiedName(NonRootModelElement xtumlElement) {
		switch xtumlElement{
			Attribute_c:
				ModelClass_c.getOneO_OBJOnR102(xtumlElement).maslQualifiedName.append(xtumlElement.name)
			Component_c:
				QualifiedName.create(xtumlElement.name)
			Function_c:
				xtumlElement.component.maslQualifiedName.append(xtumlElement.name)
//			FunctionParameter_c:
//				Function_c.getOneS_SYNCOnR24(xtumlElement).maslQualifiedName.append(xtumlElement.name)
			InterfaceOperation_c:
				// TODO: derive the name for the terminator action.
				null
			ModelClass_c:
				xtumlElement.component.maslQualifiedName.append(xtumlElement.name)
			Operation_c:
				ModelClass_c.getOneO_OBJOnR115(xtumlElement).maslQualifiedName.append(xtumlElement.name)
//			OperationParameter_c:
//				Operation_c.getOneO_TFROnR117(xtumlElement).maslQualifiedName.append(xtumlElement.name)
			Port_c:
				xtumlElement.component.maslQualifiedName.append(xtumlElement.name)
			StateMachineState_c:
				ModelClass_c.getOneO_OBJOnR518(InstanceStateMachine_c.getOneSM_ISMOnR517(StateMachine_c.getOneSM_SMOnR501(xtumlElement))).maslQualifiedName.append(xtumlElement.name)
			StateMachineEvent_c:
				ModelClass_c.getOneO_OBJOnR518(InstanceStateMachine_c.getOneSM_ISMOnR517(StateMachine_c.getOneSM_SMOnR502(xtumlElement))).maslQualifiedName.append(xtumlElement.mning)
			UserDataType_c:
				xtumlElement.component.maslQualifiedName.append(xtumlElement.name)
			default:			
				null
		}
	}
	
	
	private def getComponent(NonRootModelElement xtumlElement) {
		var parent = xtumlElement.persistableComponent
		while (parent != null) {
			if(parent.rootModelElement instanceof Component_c)
				return parent.rootModelElement
			else 
				parent = parent.parent 
		}
		return null
		
	}
}