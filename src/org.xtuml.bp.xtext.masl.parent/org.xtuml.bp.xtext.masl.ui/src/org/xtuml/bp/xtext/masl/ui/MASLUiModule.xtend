/*
 * generated by Xtext 2.9.2
 */
package org.xtuml.bp.xtext.masl.ui

import com.google.inject.Binder
import com.google.inject.name.Names
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor
import org.eclipse.xtext.ide.editor.syntaxcoloring.DefaultSemanticHighlightingCalculator
import org.eclipse.xtext.resource.containers.IAllContainersState
import org.eclipse.xtext.ui.editor.hyperlinking.IHyperlinkHelper
import org.eclipse.xtext.ui.editor.model.XtextDocumentProvider
import org.eclipse.xtext.ui.refactoring.impl.DefaultDependentElementsCalculator
import org.eclipse.xtext.ui.refactoring.impl.DefaultRenameStrategyProvider
import org.eclipse.xtext.ui.refactoring.impl.RefactoringCrossReferenceSerializer
import org.eclipse.xtext.ui.refactoring.impl.RenameElementProcessor
import org.eclipse.xtext.ui.validation.AbstractValidatorConfigurationBlock
import org.eclipse.xtext.ui.validation.DefaultResourceUIValidatorExtension
import org.xtuml.bp.xtext.masl.ide.highlighting.MaslSemanticHighligtingCalculator
import org.xtuml.bp.xtext.masl.lib.MASLDelegatingAllContainerState
import org.xtuml.bp.xtext.masl.ui.build.MaslAutoBuilder
import org.xtuml.bp.xtext.masl.ui.document.MaslDocumentProvider
import org.xtuml.bp.xtext.masl.ui.document.MaslResourceForIEditorInputFactory
import org.xtuml.bp.xtext.masl.ui.edit.MaslAutoEditStrategyProvider
import org.xtuml.bp.xtext.masl.ui.hyperlink.MASLHyperlinkHelper
import org.xtuml.bp.xtext.masl.ui.rename.MaslDependentElementsCalculator
import org.xtuml.bp.xtext.masl.ui.rename.MaslRefactoringCrossReferenceSerializer
import org.xtuml.bp.xtext.masl.ui.rename.MaslRenameElementProcessor
import org.xtuml.bp.xtext.masl.ui.rename.MaslRenameStrategyProvider
import org.xtuml.bp.xtext.masl.ui.validation.MaslValidationConfigurationBlock
import org.xtuml.bp.xtext.masl.ui.validation.ModelResourceUIValidatorExtension

import static org.eclipse.xtext.ui.editor.contentassist.XtextContentAssistProcessor.*

/**
 * Use this class to register components to be used within the Eclipse IDE.
 */
@FinalFieldsConstructor
class MASLUiModule extends AbstractMASLUiModule {
	
	def configureIAllContainersState$Provider(Binder binder) {
		binder.bind(IAllContainersState.Provider)
			.annotatedWith(Names.named(MASLDelegatingAllContainerState.DELEGATE_BINDING))
			.to(super.bindIAllContainersState$Provider)
	}

	override bindIAllContainersState$Provider() {
		MASLDelegatingAllContainerState.Provider
	}
	
	def Class<? extends IHyperlinkHelper> bindIHyperlinkHelper() {
		MASLHyperlinkHelper
	}
	
	def Class<? extends DefaultSemanticHighlightingCalculator> bindDefaultSemanticHighlightingCalculator() {
		MaslSemanticHighligtingCalculator
	}
	
	def Class<? extends AbstractValidatorConfigurationBlock> bindAbstractValidatorConfigurationBlock() {
		MaslValidationConfigurationBlock
	}
	
	def configureContentAssistAutoActivation(Binder binder) {
		binder.bind(String).annotatedWith(Names.named(COMPLETION_AUTO_ACTIVATION_CHARS)).toInstance('.->~:')
	}
	
	override bindAbstractEditStrategyProvider() {
		MaslAutoEditStrategyProvider
	}
	
	def Class<? extends DefaultResourceUIValidatorExtension> bindResourceUIValidatorExtension() {
		ModelResourceUIValidatorExtension
	}
	
	def configureMaslAutoBuilder(Binder binder) {
		binder.bind(MaslAutoBuilder).asEagerSingleton
	}
	
	def Class<? extends XtextDocumentProvider> bindXtextDocumentProvider() {
		MaslDocumentProvider
	}
	
	override bindIResourceForEditorInputFactory() {
		MaslResourceForIEditorInputFactory
    }

	def Class<? extends DefaultRenameStrategyProvider> bindDefaultRenameStrategyProvider() {
		MaslRenameStrategyProvider
	}
	
	def Class<? extends DefaultDependentElementsCalculator> bindDefaultDependentElementsCalculator() {
		MaslDependentElementsCalculator
	}
	
	def Class<? extends RefactoringCrossReferenceSerializer> bindRefactoringCrossReferenceSerializer() {
		MaslRefactoringCrossReferenceSerializer
	}
	
	def Class<? extends RenameElementProcessor> bindRenameElementProcessor() {
		MaslRenameElementProcessor
	}
}
